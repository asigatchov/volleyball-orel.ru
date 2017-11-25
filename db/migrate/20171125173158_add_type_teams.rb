class AddTypeTeams < ActiveRecord::Migration[5.0]
  def change
      add_column :teams, :gender, "enum('man','woman')", :default => 'man'
  end
end
