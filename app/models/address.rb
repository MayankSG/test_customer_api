class Address < ApplicationRecord

  validates :street, presence: true
  validates :city, presence: true
end
