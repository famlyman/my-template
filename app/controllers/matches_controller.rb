class MatchesController < ApplicationController
  before_action :authenticate_player!

  def select_match
    @match = Match.find(params[:id])

    # Ensure the current player is a team captain for either team_one or team_two
    if current_player.captain_of?(@match.team_one) || current_player.captain_of?(@match.team_two)
      # Logic for rendering the select_match view
    else
      redirect_to @match, alert: 'You are not authorized to select matches.'
    end
  end

  def confirm_match_selection
    @match = Match.find(params[:id])
    # Logic for confirming match selection
  end
end

