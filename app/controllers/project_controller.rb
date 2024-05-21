class ProjectController < ApplicationController
    def new
    end

    def show
        @project = Project.find(params[:id])
        @contestant_counter = @project.contestants.count
    end
end