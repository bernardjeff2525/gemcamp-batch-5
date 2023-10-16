class Address::Province < ApplicationRecord
  belongs_to :region
  validates :name, presence: true
  validates :code, uniqueness: true
end
