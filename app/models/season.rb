class Season < ApplicationRecord
    has_many :matches
    has_many :teams
    has_and_belongs_to_many :leagues, dependent: :destroy


    def generate_schedule
        teams = Team.all.to_a
        num_teams = teams.length
    
        # Ensure that the number of teams is even for the round-robin algorithm
        if num_teams.odd?
          teams << nil
          num_teams += 1
        end
    
        num_rounds = num_teams - 1
    
        (1..num_rounds).each do |round|
          matches = []
    
          teams.shuffle.each_slice(2) do |pair|
            matches << pair
          end
    
          matches.each do |pair|
            Match.create(team_one_id: pair[0]&.id, team_two_id: pair[1]&.id, season_id: self.id)
          end
    
          teams.rotate!(-1) # Rotate teams for the next round
        end
    end

end
