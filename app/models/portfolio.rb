class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies,
                                  reject_if: lambda { |attrs| attrs['name'].blank? }
                                  
    validates_presence_of :title, :body, :main_image, :thumb_image
    
    after_initialize :set_defaults
    
    def set_defaults
        self.main_image ||= "https://placeholder.it/400x600"
        self.thumb_image ||= "https://placeholder.it/350x400"
    end
    
end
