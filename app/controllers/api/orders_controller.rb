class Api::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_order_confirmed, only: [:update]

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.items.create(product: product)
    if order.persisted?
      render json: {
        message: 'The item was added to your order',
        order: {
          id: order.id,
          items: order.products
        }
      }, status: 201
    else
      render json: {
        message: 'Well, that went wrong..'
      }, status: 422
    end
  end

  def update
    order = Order.find(params['order_id'])
    
    if params['confirmed']
      order.update(confirmed: true)
      render json: {
        message: 'Your order is confirmed and will be available sort of soon!'
      }
    else
      product = Product.find(params[:product_id])
      order.items.create(product: product)
      if order.persisted?
        render json: {
          message: 'The item was added to your order',
          order: {
            id: order.id,
            items: order.products
          }
        }
      else
        render json: {
          message: 'Well, that went wrong..'
        }, status: 422
      end
    end
  end

  private

  def is_order_confirmed 
    order = Order.find(params['order_id'])
    return unless order.confirmed?
    
    render json: {
      message: 'Your order is already confirmed. Create a new order to order more!',
      status: 403
    }
  end
end
