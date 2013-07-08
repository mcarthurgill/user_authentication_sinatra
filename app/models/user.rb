class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :email, :name
  has_secure_password
  validates :password, :presence => true, :on => :create
end
