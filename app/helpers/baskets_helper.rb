module BasketsHelper

  FCSN_SHOPPING_BASKET_ID = 'fcsn_course_basket'

  def fcsn_shopping_basket_id
    session[FCSN_SHOPPING_BASKET_ID]
  end

  def shopping_basket
    @shopping_basket ||= ShoppingBasket.find_or_create_by(id: fcsn_shopping_basket_id)
  end

  def store_basket_in_session
    session[FCSN_SHOPPING_BASKET_ID] = @shopping_basket.id
  end

  def shopping_basket_has_courses?
    shopping_basket.items && shopping_basket.items.count > 0
  end
end
