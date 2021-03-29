class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {message: 'User already exists'}
end