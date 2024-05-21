class Contestant < ApplicationRecord
    has_many :contestant_projects
    has_many :projects, through: :contestant_projects

    def project_names
        projects.map(&:name).join(", ")
    end

    def self.average_years_of_experience
        average(:years_of_experience)
    end
end
