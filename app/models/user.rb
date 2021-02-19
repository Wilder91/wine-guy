class User < ActiveRecord::Base
    has_many :tickets 
    has_many :wines, through: :tickets
    has_secure_password
    validates :name, uniqueness: true
    validates :email, uniqueness: true
    validates :password, confirmation: true
end