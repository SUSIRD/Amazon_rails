class Student < ApplicationRecord
    has_and_belongs_to_many :courses

    after_create :print_message

    private
    def print_message
        puts "Student created"
    end
end
