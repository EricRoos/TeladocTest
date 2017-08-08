class Product < ApplicationRecord
  include Redis::Objects

  # going with redis object
  # since its atomic inc. dev operations
  # are fast
  counter :stock

  def stock_value
    stock.value
  end
end
