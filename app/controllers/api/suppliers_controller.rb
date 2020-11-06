class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    id = params[:id]
    @supplier = Supplier.find(id)
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new({
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    })
    @supplier.save

    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    id = params[:id]
    @supplier = Supplier.find(id)

    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    @supplier.save

    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    @supplier = Supplier.find(id)

    @supplier.destroy
    render json: { message: "Supplier successfully destroyed!" }
  end
end
