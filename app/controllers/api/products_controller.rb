class Api::ProductsController < ApplicationController
  def displayall
    @products = Product.all
    render "all.json.jb"
  end
end
