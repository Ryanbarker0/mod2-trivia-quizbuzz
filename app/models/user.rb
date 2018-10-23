class User < ApplicationRecord
  # belongs_to :team
  has_many :games
  has_many :categories, through: :games
  has_secure_password

  validates :name, length: {minimum: 3}
  validates_uniqueness_of :name
  validates :password, length: {minimum: 5}


end
