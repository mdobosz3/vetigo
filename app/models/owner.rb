class Owner < ApplicationRecord
  belongs_to :clinic

  validates :first_name, presence: true
  validates :last_name, presence: true
end
