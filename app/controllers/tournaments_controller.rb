class TournamentsController < ApplicationController
    
    before_action :set_tournament, only: [:show, :edit, :update, :destroy]
    def index
        @tournaments = Tournament.active 
    end

    def edit
    end


    def create
        @tournament = Tournament.new(tournament_params)
        respond_to do |format|
          if @tournament.save
            format.html { redirect_to @tournament, notice: 'Game was successfully created.' }
            format.json { render :show, status: :created, location: @tournament }
          else
            format.html { render :new }
            format.json { render json: @tournament.errors, status: :unprocessable_entity }
          end
        end
    end

    def new
        @tournament = Tournament.new
    end
    respond_to do |format|
      if @tournament.update(tournament_params)
        @tournament.teams.destroy_all
        Team.where(id: params[:tournament]['teams']).each do |team|
          @tournament.teams << team
        end
        format.html { redirect_to @tournament, notice: 'Турнир обнавлен' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end

    def show
    end


    def update
        respond_to do |format|
            if @tournament.update(tournament_params)
              @tournament.teams.destroy_all
              Team.where(id: params[:tournament]['teams']).each do |team|
                @tournament.teams << team
              end
              format.html { redirect_to @tournament, notice: 'Турнир обнавлен' }
              format.json { render :show, status: :ok, location: @tournament }
            else
              format.html { render :edit }
              format.json { render json: @tournament.errors, status: :unprocessable_entity }
            end
          end
      
    end

    
    def destroy
        @tournament.destroy
        respond_to do |format|
          format.html { redirect_to tournaments_url, notice: 'Турнир удален' }
          format.json { head :no_content }
        end
    end


    def set_tournament
       @tournament =  current_user.admin? ? Tournament.find(params[:id]) : Tournament.active.find(params[:id])
    end

    def tournament_params
        params.require(:tournament).permit(:title, :start_date, :end_date, :active )    
    end        
end
