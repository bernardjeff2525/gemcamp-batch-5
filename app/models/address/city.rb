class Address::City < ApplicationRecord
  belongs_to :province
  validates :name, presence: true
  validates :code, uniqueness: true
end
