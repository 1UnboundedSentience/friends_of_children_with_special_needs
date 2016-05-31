class Term < ActiveRecord::Base
  has_many :courses

  scope :active, -> { where("? BETWEEN start_date AND end_date", Date.today)}
end
