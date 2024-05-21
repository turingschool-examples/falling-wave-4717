class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @theme = @project.challenge.theme
    @count = @project.contestants.count
  end
end