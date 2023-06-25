class Task < ApplicationRecord
    belongs_to :tag, class_name: 'Tag', foreign_key: 'tag_id', optional: true
    belongs_to :project, class_name: 'Project', foreign_key: 'project_id', optional: true
    belongs_to :stage, class_name: 'Stage', foreign_key: 'stage_id', optional: true
    belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
    has_rich_text :description

    # validates :description, presence: true
    def self.search(search_value)
        if search_value
            where('name LIKE ?', "%#{search_value}%")
        else
            all
        end
    end
end
