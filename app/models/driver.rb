class Driver < ApplicationRecord
  validates :name, :dob, :phone, :license_plate, presence: true
  validates :phone, length: { minimum: 10, too_short: "is not valid" }
  validates :phone, numericality: { only_integer: true, message: "must be a number" }
  validates :phone, :license_plate, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
