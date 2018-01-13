class Person < ApplicationRecord
  belongs_to :family
  has_many :gift_ideas

  validates :name, :phone_number, presence: true
  validates :creator, inclusion: { in: [ true, false ] }
end
