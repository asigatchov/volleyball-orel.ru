class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :title
      t.text :desc
      t.integer :pos
      t.integer :pos
      t.boolean :active

      t.timestamps
    end
  end
end
