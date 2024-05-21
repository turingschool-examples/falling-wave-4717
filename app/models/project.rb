class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def theme
    self.challenge.theme
  end

  def contestant_count
    self.contestants.count
  end
end
