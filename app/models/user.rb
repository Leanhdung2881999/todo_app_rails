class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :destroy
    has_many :users, dependent: :nullify
end
