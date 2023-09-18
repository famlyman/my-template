class Match < ApplicationRecord
  belongs_to :team_one, class_name: "Team"
  belongs_to :team_two, class_name: "Team"
  belongs_to :season
  

  validates_presence_of :team_one, :team_two, :season
end
