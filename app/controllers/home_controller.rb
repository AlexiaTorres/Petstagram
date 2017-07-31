class HomeController < ApplicationController

  before_action :get_pet

  def index

  end

  def get_pet
    if current_pet
      @pet = current_pet
    else
      @pet ||= Pet.new
    end
  end
end
