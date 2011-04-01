class WelcomeController < ApplicationController
  def index

    @apartments = Apartment.where(:special => true).limit(4)

  end

end
