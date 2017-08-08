require 'active_support/concern'

module PurchaseProcessorConcern
  extend ActiveSupport::Concern
  included do
    #
    # responsibile for building a purchase object around
    #
    # params:
    #   user =>
    #     plain user object
    #
    #   input =>
    #     [
    #       { id: 90, quantity: 3 }
    #       { id: 35, quantity: 1 }
    #     ]
    #
    # Where id represents the product id, and the quantity
    # is the number of that item the user desires
    #
    def self.process(user, input)

      #
      # we build a reverse index here so we can do a 
      # multi select and not have to hit the db n times.
      #
      # Rather take the hit in local memory with the 2nd
      # index and perform a look up locally to do the object
      # building for the products below.
      #
      #
      products = Product.find(input.collect{ |i| i[:id]})
      reverseIndex = {}
      products.each do |p|
        reverseIndex[p.id] = p
      end

      purchase = Purchase.new
      purchase.user = user
      
      # TODO: Make this more efficient with a bulk insert
      #
      input.each do |i|
        i[:quantity].times do
          product = reverseIndex[i[:id]]
          stock = product.stock.value
          if stock <= 0
            raise 'Not enough product in stock'
          end
          product.stock.decrement
          purchase.products << product
        end
      end
      purchase.save
      purchase
    end
  end
end
 
