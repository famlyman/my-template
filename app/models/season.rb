class Season < ApplicationRecord
    has_many :teams
    belongs_to :season
    has_and_belongs_to_many :leagues

end
