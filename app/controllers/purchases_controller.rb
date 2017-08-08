class PurchasesController < ApplicationController
  def create
    products = params.require(:products)
    Rails.logger.debug products

    products.each do |product|
      product[:quantity] = product[:quantity].to_i
    end
    purchase = Purchase.process(current_user, products)
    respond_to do |format|
      format.json {render json: purchase}
    end
  end
end
