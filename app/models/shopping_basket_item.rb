class ShoppingBasketItem < ActiveRecord::Base

  belongs_to :course
  belongs_to :shopping_basket

  def fees
    course.fees_in_cents
  end
end
