class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]
    def index
        @videos = Video.active
    end


    def show
    end

    def new
        @video = Video.new
    end
    def create
        @video = Video.new(video_params)
        respond_to do |format|
          if @video.save
            format.html { redirect_to @video, notice: 'Видео добавлено' }
            format.json { render :show, status: :created, location: @video }
          else
            format.html { render :new }
            format.json { render json: @video.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
            if @video.update(video_params)
              format.html { redirect_to @video, notice: 'Видео обнавлен' }
              format.json { render :show, status: :ok, location: @video }
            else
              format.html { render :edit }
              format.json { render json: @video.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        @video.destroy
        respond_to do |format|
          format.html { redirect_to videos_url, notice: 'Video удалено.' }
          format.json { head :no_content }
        end
    end

    def set_video
        @video = Video.find(params[:id])
    end
    
    def video_params
        params.require(:video).permit(:title, :desc, :pos, :active, :team_a, :team_b, 
                                :youtube_id, :tournament_id, :image)
    end


end
