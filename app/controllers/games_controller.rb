class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.includes([:team_one,:team_two,:member_one, :member_two])
    @games = @games.where(tournament_id: params[:tournament_id]) if params[:tournament_id]
    @games = @games.sheduled.where("start_at < ?", Time.now).order('start_at DESC')
  end


  def show
    @title = @game.title
  end


  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_all_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all
    @games = Game.order('start_at desc')
    @games = @game.where(tournament_id: params[:tournament_id]) if params[:tournament_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:start_at, :place_name, :team_a, :team_b, :member_a, :member_b,
         :score_a, :score_b, :full_score, :rescheduled, :tournament_id, :video_id )
    end
end
