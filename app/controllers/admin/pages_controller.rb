class Admin::PagesController < ::AdminController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to([:admin, @page], :notice => 'Page was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

      if @page.update_attributes(params[:page])
        redirect_to([:admin, @page], :notice => 'Page was successfully updated.')
      else
        render :action => "edit"
      end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to(admin_pages_url)
  end
end
