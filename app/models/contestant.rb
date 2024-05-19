class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def projects_worked_on
    projects.pluck(:name)
  end
end
