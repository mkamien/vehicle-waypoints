class Vehicle < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
end
