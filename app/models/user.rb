class User < ActiveRecord::Base
    has_many :wines
   
    has_secure_password
    validates :name, uniqueness: true
    validates :email, uniqueness: true, presence: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, confirmation: true
end