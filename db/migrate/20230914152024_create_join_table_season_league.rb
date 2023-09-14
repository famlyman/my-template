class CreateJoinTableSeasonLeague < ActiveRecord::Migration[7.0]
  def change
    create_join_table :seasons, :leagues do |t|
      t.index [:season_id, :league_id]
      t.index [:league_id, :season_id]
    end
  end
end
