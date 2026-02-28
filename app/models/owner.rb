class Owner < ApplicationRecord
  has_many :pets, dependent: :destroy
  belongs_to :clinic

  validates :first_name, presence: true
  validates :last_name, presence: true
end
