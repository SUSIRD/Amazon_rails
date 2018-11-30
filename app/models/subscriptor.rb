class Subscriptor < ApplicationRecord
    validates :name, :email, presence: true 
end
