require "rails_helper"

RSpec.describe Contestant, type: :model do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe ".projects_worked_on" do
    it "gets all names of projects contestant has worked on" do
      expect(@jay.projects_worked_on).to eq(["News Chic"])
    end
  end
end
