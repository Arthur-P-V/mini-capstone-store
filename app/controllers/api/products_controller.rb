class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    search = params[:search]
    sort = params[:sort]
    sort_order = params[:sort_order]
    discount = params[:discount]

    @products = @products.order(:id)

    if sort == "price" && sort_order == "desc"
      @products = @products.order(price: :desc)
    end

    if sort == "price"
      @products = @products.order(:price)
    end

    if discount == "true"
      @products = @products.where("price < 200")
    end

    if search
      @products = @products.where("name LIKE ?", "%#{search}%")
    end

    render "index.json.jb"
  end

  def show
    input = params["id"]
    @product = Product.find(input)
    render "show.json.jb"
  end

  def create
    @product = Product.new({
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    })

    if @product.save
      @product.addimage(params["url"])
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product_id = params["id"]
    @product = Product.find(product_id)
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.description = params["description"] || @product.description
    @product.save

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params["id"]
    @product = Product.find(product_id)
    images = Image.where(product_id: product_id)
    images.destroy
    @product.destroy
    render json: {
      message: "Product successfully destroyed",
    }
  end
end
