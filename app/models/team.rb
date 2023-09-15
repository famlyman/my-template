class Team < ApplicationRecord
    has_many :home_matches, class_name: 'Schedule', foreign_key: 'team_1', dependent: :destroy
    has_many :away_matches, class_name: 'Schedule', foreign_key: 'team_2', dependent: :destroy
    belongs_to :league
    belongs_to :season, optional: true
    has_and_belongs_to_many :players
end
