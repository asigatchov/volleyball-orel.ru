class Video < ActiveRecord::Migration[5.0]
  def change
    create_table  :videos do |t|
      t.string :title
      t.text :desc
      t.string  :youtube_id
      t.string  :image
      t.integer :tournament_id
      t.integer :team_a
      t.integer :team_b
      t.integer :pos
      t.boolean :active
      t.timestamps
    end
  end
end
