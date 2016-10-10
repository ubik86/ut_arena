class ImportGamesController < ApplicationController

  def index
    @imports = ImportGame.all.includes(:games)
  end

  def new
    @game = ImportGame.new
  end

  def create
    @game = ImportGame.new(import_game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def import_game_params
    params.require(:import_game).permit(game_logs: [])
  end
end
