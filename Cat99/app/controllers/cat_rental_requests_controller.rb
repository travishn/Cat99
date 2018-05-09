class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @request = CatRentalRequest.new
    render :new
  end
end
