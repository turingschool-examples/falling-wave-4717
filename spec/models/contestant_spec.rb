require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "instance methods" do
    describe "#project_names" do
      it "returns a string of project names the contestant has worked on" do
        recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
        jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id)

        expect(jay.project_names).to eq("News Chic")
      end
    end
  end
  describe "class methods" do
    describe "#average_years_of_experience" do
      it "returns the average years of experience for all contestants" do
        jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        expect(Contestant.average_years_of_experience).to eq(12.5)
      end
    end
  end
end
