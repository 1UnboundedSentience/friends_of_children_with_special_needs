class Term < ActiveRecord::Base
  has_many :courses

  default_scope {order('start_date DESC')}
  scope :active, -> { where("? BETWEEN start_date AND end_date", Date.today)}

  validates :name, uniqueness: true
end
