class Team < ApplicationRecord
  has_many :members
  has_many :game_one,  class_name: 'Game' , foreign_key: :team_a
  has_many :game_two,  class_name: 'Game' , foreign_key: :team_b
end
