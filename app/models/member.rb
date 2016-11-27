class Member < ApplicationRecord

  belongs_to :team
  has_attached_file :photo, styles: { medium: "250x300>" }, default_url: "/system/members/default.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
