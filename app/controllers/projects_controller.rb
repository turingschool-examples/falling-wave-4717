class ProjectsController < ApplicationController
  def show
    # binding.pry
    @project = Project.find(params[:id])
    # binding.pry
  end
end