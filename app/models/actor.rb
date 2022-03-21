class Actor < ActiveRecord::Base
    has_many :characters 
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        name = ""
        show_name = ""
        self.characters.each do |character|
            name << character.name
        end
        
        self.shows.each do |show|
            show_name << show.name
        end

        "#{name} - #{show_name}"
    end
end