class AddVideoToGamge < ActiveRecord::Migration[5.0]
  def change
    add_column :games , :video_id, :integer
  end
end
