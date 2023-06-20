class Stage < ApplicationRecord
    has_many :tasks, dependent: :nullify
end
