require "rails_helper"

RSpec.describe "Project Show", type: :feature do
  describe "As a visitor" do
    scenario "when I visit the show page I should see" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Theme: Recycled Material")
      expect(page).to have_content("Name: News Chic")
      expect(page).to have_content("Material: Newspaper")
    end

  end
end
