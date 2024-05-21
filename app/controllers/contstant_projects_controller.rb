class ContestantProjectsController < ApplicationController
    def index
        @contestant_projects = ContestantProject.all
    end

    def show
        @contestant_projects = ContestantProject.find(params[:id])
    end

    private

    def contestant_project_params
        params.permit(:id, :contestant, :project_id)
    end
end
