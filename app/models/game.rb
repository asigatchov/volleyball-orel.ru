class Game < ApplicationRecord
   belongs_to :team_one, class_name: "Team", foreign_key: :team_a
   belongs_to :team_two, class_name: "Team", foreign_key: :team_b
   belongs_to :member_one, class_name: "Member", foreign_key: :member_a, optional: true
   belongs_to :member_two, class_name: "Member", foreign_key: :member_b, optional: true
   scope :sheduled, -> {where(rescheduled: false)}
   scope :resheduled, -> {where(rescheduled: true)}
   scope :future, -> {where(rescheduled: false).where('start_at > ?', Time.now)}
   scope :old, -> {where(rescheduled: false).where('start_at < ?', Time.now)}
end
