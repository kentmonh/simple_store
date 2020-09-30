class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def view
    @product = Product.find(params[:id])
  end
end
