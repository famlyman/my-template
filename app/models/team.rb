class Team < ApplicationRecord
    belongs_to :captain, class_name: 'Player'
    belongs_to :league
    belongs_to :season, optional: true
    has_and_belongs_to_many :players
end
