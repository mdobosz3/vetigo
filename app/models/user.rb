class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :appointments, through: :pets
  has_one :vet

  def vet?
    vet.present?
  end

  def full_name
    [ first_name, last_name ].compact.join(" ").presence || email
  end
end
