class CreateLojas < ActiveRecord::Migration
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :website
      t.string :logo
      t.string :email

      t.timestamps null: false
    end
  end
end
