class AddLeaguesIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :league, null: true, foreign_key: true
  end
end
