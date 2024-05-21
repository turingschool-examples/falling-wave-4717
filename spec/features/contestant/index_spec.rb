require "rails_helper"

RSpec.describe "Contestants Index" do
  describe "As a visitor" do
    scenario "when I visit the index page I should see a list of names of all the contestants and projects they've been on" do 
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)

      visit "/contestants"
      save_and_open_page
      expect(page).to have_content("Kentaro Kameyama")
      expect(page).to have_content("Projects: Boardfit") #need to figure out how to make them on one line comma delimited
      expect(page).to have_content("Upholstery Tuxedo")
      expect(page).to have_content("Jay McCarroll")
      expect(page).to have_content("Projects: News Chic")
    end
  end
end
