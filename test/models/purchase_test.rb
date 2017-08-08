require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
  end

  teardown do

  end

  test "creating all products with quantity" do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    puts "Env: #{Rails.env}"
    Rails.logger.debug "Env: #{Rails.env}"
    p1 = Product.create(name: "test 1")
    p2 = Product.create(name: "test 2")
  
    p1_quantity = 5
    p2_quantity = 7

    input = []
    input << { id: p1.id, quantity: p1_quantity}
    input << { id: p2.id, quantioty: p2_quantity}

    purchase = Purchase.process(u, input)

    assert purchase.products.where(id: p1.id).count == p1_quantity
    assert purchase.products.where(id: p2.id).count == p2_quantity
    assert purchase.products.count == p1_quantity + p2_quantity
  end
end
