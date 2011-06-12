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

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to([:admin, @apartment], :notice => 'Apartment was successfully created.') }
        format.xml  { render :xml => @apartment, :status => :created, :location => @apartment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @apartment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @apartment = Apartment.find(params[:id])

    respond_to do |format|
      if @apartment.update_attributes(params[:apartment])
        format.html { redirect_to(@apartment, :notice => 'Apartment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @apartment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to(admin_apartments_url)
  end
end
