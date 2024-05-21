class ContestantsController < ApplicationController
    def index
        @contestants = Contestant.all
    end

    def show
        @contestant = Contestant.find(params[:id])
    end

    private

    def contestant_params
        params.permit(:id, :name, :age, :hometown, :years_of_experience, :project_id)
    end
end
