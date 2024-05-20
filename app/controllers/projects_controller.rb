class ProjectsController < ApplicationController
  def show
    # pry
    @project = Project.find(params[:project_id])
    # pry
    @theme = @project.challenge.theme
  end
end