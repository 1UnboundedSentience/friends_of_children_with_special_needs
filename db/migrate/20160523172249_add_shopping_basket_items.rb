class AddShoppingBasketItems < ActiveRecord::Migration
  def change
    create_table :shopping_basket_items do |t|
      t.integer :shopping_basket_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
