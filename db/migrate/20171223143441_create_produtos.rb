class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :productId
      t.string :productName
      t.float :price
      t.integer :plots
      t.string :image
      t.string :link
      t.timestamps null: false
    end
  end
end
