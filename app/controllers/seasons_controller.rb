class SeasonsController < ApplicationController
  before_action :set_season, only: %i[ show edit update destroy generate_schedule generate_matches]

  # GET /seasons or /seasons.json
  def index
    @seasons = Season.all
  end

  # GET /seasons/1 or /seasons/1.json
  def show
    @season = Season.find(params[:id])
    @teams = @season.teams
    @leagues = @season.leagues
    current_date = Date.today
    @current_season = Season.where("start_date <= ? AND end_date >= ?", current_date, current_date).first
    
    
    @schedules = @season.schedules.order(:date)
    @matches = @season.matches.order(:date)
  end

  # GET /seasons/new
  def new
    @season = Season.new
  end

  # GET /seasons/1/edit
  def edit
    @season = Season.find(params[:id])
    @leagues = League.all
  end

  # POST /seasons or /seasons.json
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to season_url(@season), notice: "Season was successfully created." }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasons/1 or /seasons/1.json
  def update
    @season = Season.find(params[:id])
    
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to season_url(@season), notice: "Season was successfully updated." }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1 or /seasons/1.json
  def destroy
    @season.destroy

    respond_to do |format|
      format.html { redirect_to seasons_url, notice: "Season was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_schedule
    @season = Season.find(params[:id])
    @season.generate_schedule # Assuming you have a generate_schedule method in your Season model
    redirect_to @season, notice: "Schedule generated successfully"
  end

  def generate_matches
    @season = Season.find(params[:id])
    @season.generate_matches
    redirect_to @season, notice: "Matches generated successfully"
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.require(:season).permit(:name, :start_date, :end_date, league_ids: [] )
    end
end
