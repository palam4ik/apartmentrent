class ApartmentsController < ApplicationController

  def index
    @apartments = Apartment.all
  end

  # /apartments/2/rooms
  # params = {action => rooms controller => apartments id => 2}
  def rooms

    @apartments = Apartment.where(:rooms => params[:id])
    render :index
  end
  # apartments/1

  def show
    # @apartment = Apartment.where(:id => params[:id])- возвращает массив ...find- возвращает
    # один объект

    @apartment = Apartment.find(params[:id])
  end

end
  