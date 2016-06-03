class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :person

  has_many :students
  #todo has_many :courses, :if is_coordinator=true or is_instructor=true
  accepts_nested_attributes_for :person

  delegate :name, :display_name, to: :person
end
