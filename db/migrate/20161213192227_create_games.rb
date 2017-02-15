class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :start_at
      t.string :place_name
      t.integer :team_a
      t.integer :team_b
      t.integer :member_a
      t.integer :member_b
      t.integer :score_a
      t.integer :score_b
      t.string :full_score

      t.timestamps
    end
  end
end
