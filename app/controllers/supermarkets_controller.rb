class SupermarketsController < ApplicationController

  def index
    @supermarket = Supermarket.find(params[:id])
  end

  def show
    @supermarket = Supermarket.find(params[:id])
  end
  
end
