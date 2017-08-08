class CreatePurchasedProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :purchased_products do |t|
      t.references :product, foreign_key: true
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
