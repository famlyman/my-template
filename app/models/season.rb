class Season < ApplicationRecord
    has_many :schedules
    has_many :teams
<<<<<<< HEAD
    has_many :matches, class_name: 'Match', dependent: :destroy
    belongs_to :home, class_name: 'Team', foreign_key: 'home_id'
    belongs_to :away, class_name: 'Team', foreign_key: 'away_id'    
=======
>>>>>>> parent of c8636d4 (schedule stuff)
    has_and_belongs_to_many :leagues

    def generate_schedule
        # Define your schedule parameters
        start_date = self.start_date
        end_date = self.end_date
        start_time = Time.parse('18:00:00')
    
        # Get all teams
        teams = self.teams
    
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

    def generate_matches 
        teams = Team.all.to_a
        matches = []

        (teams.size - 1).times do
            home_team = teams.shift
            teams.each do |away_team|
            matches << [home_team, away_team]
            end
        end

        # Now you have a list of match pairs in the 'matches' array
        # You can use this list to create Schedule records
        matches.each do |home_team, away_team|
            Schedule.create(home: home_team, away: away_team, season: self)
        end
    
    end
end
