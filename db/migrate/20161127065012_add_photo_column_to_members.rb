class AddPhotoColumnToMembers < ActiveRecord::Migration[5.0]

  def up
   add_attachment :members, :photo
 end

 def down
   remove_attachment :members, :photo
 end
end
