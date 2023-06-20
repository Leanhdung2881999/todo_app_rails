class Tag < ApplicationRecord
    enum :type_tag, [ :low, :medium, :high ]
    has_many :projects, dependent: :nullify
    has_many :tasks, dependent: :nullify
    
    def color
        case type_tag
        when :low
            return "#51e80c"
        when :medium
            return "#ffdd18"
        else
            return "#f3252e"
        end
    end

    validates :type_tag, presence: true
end
