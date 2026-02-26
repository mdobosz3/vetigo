class Owner < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
