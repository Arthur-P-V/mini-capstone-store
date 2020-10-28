class Api::ProductsController < ApplicationController
  def displayall
    @products = Product.all
    render "all.json.jb"
  end

  def spoon
    @spoon = Product.first
    render "spoon.json.jb"
  end

  def tape
    @tape = Product.second
    render "tape.json.jb"
  end

  def chair
    @chair = Product.third
    render "chair.json.jb"
  end
end
