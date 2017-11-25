class Team < ApplicationRecord
  scope :active, -> {where(active:true)}
  scope :women, -> {where(gender: :woman)}
  scope :men, -> {where(gender: :man)}


  has_many :members
  has_many :game_one,  class_name: 'Game' , foreign_key: :team_a
  has_many :game_two,  class_name: 'Game' , foreign_key: :team_b

  has_many :video_one,  class_name: 'Video' , foreign_key: :team_a
  has_many :video_two,  class_name: 'Video' , foreign_key: :team_b



  has_and_belongs_to_many :tournaments
  
end
