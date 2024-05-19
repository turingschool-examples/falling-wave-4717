class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @project_material = @project.material
    @project_challenge_theme = @project.challenge.theme
    @contestant_count = @project.contestant_count
    @average_years_exp = @project.average_years_exp
  end
end