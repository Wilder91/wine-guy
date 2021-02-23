class User < ActiveRecord::Base
    has_many :wines
   
    has_secure_password
    validates :name, uniqueness: true
    validates :email, uniqueness: true
    validates :password, confirmation: true
end