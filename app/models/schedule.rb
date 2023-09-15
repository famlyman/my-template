class Schedule < ApplicationRecord
  has_many :matches
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  def self.generate_matches
    # lib/schedule_generator.rb
    require_relative '../config/environment'

    # Define your schedule parameters
    start_date = Date.parse('2023-09-12')
    end_date = start_date + 8.weeks
    start_time = Time.parse('18:00:00')

    # Get all teams
    teams = Team.all

    # Generate matches
    (start_date..end_date).each do |date|
      teams.each_with_index do |home_team, i|
        away_team = teams[(i + 1) % teams.size]

        Schedule.create(
          date: date.to_datetime + start_time.seconds_since_midnight.seconds,
          time: start_time,
          home_team: home_team,
          away_team: away_team
        )
      end
    end
  end

end

