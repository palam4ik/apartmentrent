class Admin::PhotosController < ::AdminController
  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      redirect_to(@photo, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end
end