class PagesController < ApplicationController
  def home
  end

  def rank
    @fuel_supplies = FuelSupply.rank
  end
end
