class Purchase < ApplicationRecord
  include PurchaseProcessorConcern
  belongs_to :user
  has_many :purchased_products
  has_many :products, through: :purchased_products
end
