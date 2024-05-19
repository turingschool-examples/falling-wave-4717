require "rails_helper"

RSpec.describe Project, type: :model do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe ".contestant_count" do
    it "can count the number of contestants working on project" do
      expect(@news_chic.contestant_count).to eq(2)
    end
  end

  describe ".average_years_exp" do
    it "can return the average years of experience of each contestant working on project" do
      expect(@news_chic.average_years_exp).to eq(12.5)
    end
  end
end
