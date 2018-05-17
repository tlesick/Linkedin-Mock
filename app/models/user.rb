class User < ActiveRecord::Base
  has_secure_password
  has_one :portfolio
  has_many :connection
  


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, on: :create
  validates :email, presence: true, uniqueness: {case_sensitive: false }, format: { with: EMAIL_REGEX }, on: :create
  validates :password, :confirmation => true
  validates :password, length: {minimum: 6}

end
