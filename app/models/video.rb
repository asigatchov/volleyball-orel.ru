class Video < ApplicationRecord
    scope :active, -> {where(active:true)}  

    belongs_to :team_one, class_name: "Team", foreign_key: :team_a, optional: true
    belongs_to :team_two, class_name: "Team", foreign_key: :team_b, optional: true

    
 
end
