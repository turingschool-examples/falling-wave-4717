require "rails_helper"

RSpec.describe "contestant index page", type: :feature do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  # As a visitor,
  # When I visit the contestants index page ("/contestants")
  # I see a list of names of all the contestants
  # And under each contestants name I see a list of the projects (names) that they've been on
  describe "as a visitor" do
    describe "when I visit the contestants index page" do
      it "I see a list of names of all the contestants, and under each contestants name I see a list of the projects (names) that they've been on" do
        visit "/contestants"

        expect(page).to have_content("Name: #{@contestant.name}")
        expect(page).to have_content("Name: #{@project.name}")
      end
    end
  end

end
