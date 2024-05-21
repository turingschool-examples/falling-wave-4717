class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
		# require 'pry'; binding.pry
  end

  def contestants
    @project = Project.find(params[project_id])
    # require 'pry'; binding.pry
  end
end