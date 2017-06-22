class Skill < ApplicationRecord
    after_initialize :set_defaults
    
    def set_defaults
    end
end
