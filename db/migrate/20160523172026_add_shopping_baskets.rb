class AddShoppingBaskets < ActiveRecord::Migration
  def change
    create_table :shopping_baskets do |t|
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
