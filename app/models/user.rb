class User < ApplicationRecord
    has_secure_password
    has_many :projects, dependent: :destroy
    has_many :tasks, dependent: :nullify

end
