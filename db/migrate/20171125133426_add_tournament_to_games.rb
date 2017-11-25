class AddTournamentToGames < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :tournament_id, :integer,  default: 0
    execute 'UPDATE games set tournament_id=1'
  end

  def down
    remove_column :games, :tournament_id
  end
end
