class AddRescheduledToGames < ActiveRecord::Migration[5.0]
  def up
      add_column :games, :rescheduled, :boolean,  default: 0

  end
  def down
    remove_column :games, :rescheduled
  end
end
