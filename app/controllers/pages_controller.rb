class PagesController < ApplicationController
  def show
    @page = Page.where(:url => params[:url]).first

  end

end