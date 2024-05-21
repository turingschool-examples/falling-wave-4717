class ContestantsController < ApplicationController
  def index 
    @contestants = Contestant.all
    # @projects = Contestant.projects
    # binding.pry
    # @contestants.each do |contestant|
    #   # binding.pry
    #   @projects << contestant.projects 
    #   binding.pry
    # end
  end
end