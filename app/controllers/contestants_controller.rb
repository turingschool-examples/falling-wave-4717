class ContestantsController < ApplicationController
  def index
    # pry
    @contestants = Contestant.all
    # pry
    
  end
end