require "rails_helper"

RSpec.describe "Project Show", type: :feature do
  describe "As a visitor" do
    scenario "when I visit the show page I should see" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

      visit "/projects/#{news_chic.id}"
      save_and_open_page
      expect(page).to have_content("Project Name: News Chic")
      expect(page).to have_content("Material: Newspaper")
      expect(page).to have_content("Challenge Theme: Recycled Material")
      expect(page).to have_content("Number of Contestants: 2")
    end

  end
end
