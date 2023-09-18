class Season < ApplicationRecord
    has_many :matches
    has_many :teams
    has_and_belongs_to_many :leagues, dependent: :destroy


    def generate_schedule
        players = Player.all.to_a
        num_players = players.length
    
        # Ensure that the number of players is even for the round-robin algorithm
        if num_players.odd?
          players << nil
          num_players += 1
        end
    
        num_rounds = num_players - 1
    
        (1..num_rounds).each do |round|
          matches = []
    
          players.shuffle.each_slice(2) do |pair|
            matches << pair
          end
    
          matches.each do |pair|
            Match.create(player1_id: pair[0]&.id, player2_id: pair[1]&.id, round: round, season_id: self.id)
          end
    
          players.rotate!(-1) # Rotate players for the next round
        end
    end

end
