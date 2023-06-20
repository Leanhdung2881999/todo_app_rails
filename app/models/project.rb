class Project < ApplicationRecord
    belongs_to :tag, class_name: 'Tag', foreign_key: 'tag_id', optional: true
    belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
    has_many :stages, dependent: :destroy
    has_many :tasks, dependent: :destroy

    has_rich_text :description

    scope :owner_projects, ->(user_id) { where("user_id = ?", user_id) }
end
