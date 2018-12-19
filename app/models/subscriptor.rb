# == Schema Information
#
# Table name: subscriptors
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscriptor < ApplicationRecord
    validates :name, :email, presence: true  
    def capitalize_name
       self.name = self.name.capitalize
    end
end
