class Admin::ApartmentsController < ::AdminController

  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
    @apartment.photos.build
  end

  def edit
    @apartment = Apartment.find(params[:id])
    @photo = Photo.new
  end

  def create
    @apartment = Apartment.new(params[:apartment])

    if @apartment.save
      redirect_to([:admin, @apartment], :notice => 'Apartment was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update_attributes(params[:apartment])
      redirect_to(@apartment, :notice => 'Apartment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to(admin_apartments_url)
  end
end
