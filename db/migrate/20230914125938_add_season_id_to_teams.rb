class AddSeasonIdToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :season, null: true, foreign_key: true
  end
end
