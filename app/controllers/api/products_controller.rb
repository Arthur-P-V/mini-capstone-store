class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "all.json.jb"
  end

  def show
    input = params["id"]
    @output = Product.find(input)
    render "individual.json.jb"
  end

  def create
    @output = Product.new({
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    })
    @output.save
    render "individual.json.jb"
  end

  def update
    product_id = params["id"]
    @output = Product.find(product_id)
    @output.name = params["name"] || @output.name
    @output.price = params["price"] || @output.price
    @output.image_url = params["image_url"] || @output.image_url
    @output.description = params["description"] || @output.description
    @output.save
    render "individual.json.jb"
  end

  def destroy
    product_id = params["id"]
    @product = Product.find(product_id)
    @product.destroy
    render json: {
      message: "Product successfully destroyed",
    }
  end
end
