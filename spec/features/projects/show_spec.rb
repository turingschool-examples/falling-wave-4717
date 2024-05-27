require "rails_helper"

RSpec.describe "project show page", type: :feature do

  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
  end

  # As a visitor,
  # When I visit a project's show page ("/projects/:id"),
  # I see that project's name and material
  # And I also see the theme of the challenge that this project belongs to.
  describe "as a visitor" do
    describe "when I visit a project's show page" do
      it "I see that project's name and material, and I also see the theme of the challenge that this project belongs to" do
        visit "/projects/#{@news_chic.id}"

        expect(page).to have_content("Project Name: #{@news_chic.name}")
        expect(page).to have_content("Project Material: #{@news_chic.material}")
        expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
      end

      # As a visitor,
      # When I visit a project's show page
      # I see a count of the number of contestants on this project
      it "I see a count of the number of contestants on this project" do
        visit("/projects/#{@news_chic.id}")

        expect(page).to have_content("Contestant Count: 2")

        visit("/projects/#{@boardfit.id}")

        expect(page).to have_content("Contestant Count: 1")
      end
    end
  end
end
