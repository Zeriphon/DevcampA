class Skill < ApplicationRecord
    include Placeholder
    after_initialize :set_defaults
    
    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '600', width: '400')
    end
end
