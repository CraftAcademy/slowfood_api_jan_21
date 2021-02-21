class Api::ProductsController < ApplicationController
  def index
    if params['category']
      products = Product.where(category: params['category'])
      render json: { products: products }
    else
    products = Product.all
    render json: { products: products }
    end
  end
end
