class LineItem < ApplicationRecord
  # < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
      self.quantity * self.product.price
  #     def create
  #   # Find associated product and current cart
  #   chosen_product = Product.find(params[:product_id])
  #   current_cart = @current_cart
  #
  #   # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  #   if current_cart.products.include?(chosen_product)
  #     # Find the line_item with the chosen_product
  #     @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
  #     # Iterate the line_item's quantity by one
  #     @line_item.quantity += 1
  #   else
  #     @line_item = LineItem.new
  #     @line_item.cart = current_cart
  #     @line_item.product = chosen_product
  #   end
  #
  #   # Save and redirect to cart show path
  #   @line_item.save
  #   redirect_to cart_path(current_cart)
  # end
  #
  # private
  #   def line_item_params
  #     params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  #   end
#     def destroy
#   @line_item = LineItem.find(params[:id])
#   @line_item.destroy
#   redirect_to cart_path(@current_cart)
# end
# def add_quantity
#   @line_item = LineItem.find(params[:id])
#   @line_item.quantity += 1
#   @line_item.save
#   redirect_to cart_path(@current_cart)
# end
#
# def reduce_quantity
#   @line_item = LineItem.find(params[:id])
#   if @line_item.quantity > 1
#     @line_item.quantity -= 1
#   end
#   @line_item.save
#   redirect_to cart_path(@current_cart)
# end
def create
  @order = Order.new(order_params)
  @current_cart.line_items.each do |item|
    @order.line_items << item
    item.cart_id = nil
  end
  @order.save
  Cart.destroy(session[:cart_id])
  session[:cart_id] = nil
  redirect_to root_path
end

private
  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
  end
end
