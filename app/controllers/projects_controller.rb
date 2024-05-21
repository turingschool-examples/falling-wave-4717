class ProjectsController < ApplicationController
    # def index
    #     @projects = Project.all 
    # end

    def show
        @project = Project.find(params[:id])
    end

    private

    def project_params
        params.permit(:id, :name, :material, :contestant_id, :challenge_id)
    end
end
