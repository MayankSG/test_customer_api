class Customer < ApplicationRecord
  has_secure_token :auth_token

  # Associations
  belongs_to :address

  # Validations
  validates :name, presence: true

  # Scopes
  scope :filter_by_street, -> (street) { joins(:address).where("addresses.street = ?", street) }
  scope :filter_by_name, -> (name) { where("customers.name = ?", name) }
end
