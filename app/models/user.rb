class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :person

  has_many :students

  accepts_nested_attributes_for :person

  scope :by_name, -> { joins(:person).order('people.last_name, people.first_name') }

  scope :instructors, -> {where(is_instructor: true).by_name}
  scope :coordinators, ->  { where(is_coordinator: true).by_name}

  delegate :name, :display_name, to: :person

  validates :email, uniqueness: true
end
