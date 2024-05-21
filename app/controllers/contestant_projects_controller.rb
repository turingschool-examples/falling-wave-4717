class ContestantProjectsController < ApplicationController
    def index
        @contestant = Contestant.find(params[:contestant_id])
        @projects = @contestant.projects
    end

    def create
        artist = Artist.create(artist_params)
        redirect_to "/artists"
        # binding.pry
    end
end