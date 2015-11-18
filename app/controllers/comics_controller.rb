class ComicsController < ApplicationController

	def index
		@comics = Comic.order(:id).page(params[:page]).per_page(10)
	end

	def new
		@comics = Comic.new
	end

	def create
    	Comic.create(comic_params)
    	redirect_to root_path
  	end

  	private

  	def comic_params
    	params.require(:comic).permit(:name, :description, :artist)
  	end
end
