class Admin::ApartmentsController < ::AdminController
  # GET /apartments
  # GET /apartments.xml
  def index
    @apartments = Apartment.all

  end

  # GET /apartments/1
  # GET /apartments/1.xml
  def show
    @apartment = Apartment.find(params[:id])

  end

  # GET /apartments/new
  # GET /apartments/new.xml
  def new
    @apartment = Apartment.new

  end

  # GET /apartments/1/edit
  def edit
    @apartment = Apartment.find(params[:id])
  end

  # POST /apartments
  # POST /apartments.xml
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

  # PUT /apartments/1
  # PUT /apartments/1.xml
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

  # DELETE /apartments/1
  # DELETE /apartments/1.xml
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy


    redirect_to(admin_apartments_url)

  end
end
