class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_item, :remove_item, :update_quantity, :destroy]

  # GET /carts/1 or /carts/1.json
  def show
    @cart_items = @cart.cart_items.includes(:product)  # Eager load products
  end

  # POST /carts/add_item
  def add_item
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@cart)
  end

  # POST /carts/remove_item
  def remove_item
    @cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    @cart_item&.destroy
    redirect_to cart_path(@cart)
  end

  # POST /carts/update_quantity
  def update_quantity
    @cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
    @cart_item.update(quantity: params[:quantity]) if @cart_item
    redirect_to cart_path(@cart)
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.cart_items.destroy_all  # This will remove all items from the cart
    redirect_to cart_path(@cart), notice: "Cart was successfully emptied."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = current_user.cart
    puts "Current User: #{current_user.inspect}"
    puts "Current Cart: #{@cart.inspect}"
  end
end
