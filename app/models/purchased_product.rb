class PurchasedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :purchase

end
