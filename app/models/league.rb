class League < ApplicationRecord
    has_many :teams
    has_and_belongs_to_many :seasons

end
