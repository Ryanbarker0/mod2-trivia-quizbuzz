class User < ApplicationRecord
  # belongs_to :team
  has_many :games
  has_many :categories, through: :games
  has_secure_password

end
