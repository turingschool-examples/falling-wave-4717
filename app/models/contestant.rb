class Contestant < ApplicationRecord
  has_many :contestant_projects 
  has_many :projects, through: :contestant_projects 

  # def projects
  #   binding.pry
  #   self.projects.map do |project|
  #     project.name
  #   end
  # end
end
