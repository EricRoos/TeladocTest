class ProductsController < ApplicationController
  def index
    @products = Product.all.map {|m| m.serializable_hash(methods: :stock_value)}
    respond_to do |format|
      format.html
    end
  end
end
