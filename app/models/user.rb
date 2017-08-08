class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :scooters, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # validates :first_name, presence: true TODO: ADD FORM TO SIGN UP PAGE
  # validates :last_name, presence: true TODO: ADD FORM TO SIGN UP PAGE
end
