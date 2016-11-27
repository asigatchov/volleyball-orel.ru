class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :title
      t.date :birthday
      t.integer :pos
      t.boolean :active
      t.integer :team_id

      t.timestamps
    end
  end
end
