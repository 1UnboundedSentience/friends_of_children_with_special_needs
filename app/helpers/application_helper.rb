module ApplicationHelper

  #TODO humanized_money_with_symbol
  def humanize_money_from_cents(amount_in_cents, options = {})
    options = { precision: 2, delimiter: ',' }.merge(options)
    number_with_precision(amount_in_cents/100.0, options)
  end
end
