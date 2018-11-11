class Vehicle < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  has_many :waypoints
end
