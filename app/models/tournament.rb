class Tournament < ApplicationRecord
  scope :active, -> {where(active:true)}
  has_many :games
  has_and_belongs_to_many :teams
  
end
