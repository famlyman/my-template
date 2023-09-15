class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.time :time
      t.references :home_team, null: false, foreign_key: true
      t.references :away_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
