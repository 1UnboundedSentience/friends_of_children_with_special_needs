class ShoppingBasket < ActiveRecord::Base

  has_many :shopping_basket_items
  accepts_nested_attributes_for :shopping_basket_items

  alias_attribute :items, :shopping_basket_items

  def total_fees
    items.any? ? items.map(&:fees).sum : 0
  end

  def items_count
    items.count
  end

  def add_item_to_basket(course_id)
    items << items.build({ course_id: course_id, shopping_basket: self})
  end

  def remove_item_from_basket(course_id)
    self.items = items.to_a.delete_if{ |item| item.course_id.to_i == course_id.to_i }
  end

  def find_basket_item(course_id)
    items.select{ |item| item.course_id.to_i == course_id.to_i }.first
  end

  def includes_course?(course_id)
    find_basket_item(course_id).present?
  end
end
