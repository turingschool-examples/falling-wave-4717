require "rails_helper"

RSpec.describe "Project Show", type: :feature do
  describe "As a Vistior" do
    context "visit the project's show page" do
      before :each do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        
        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
        
        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)

        visit "/projects/#{@news_chic.id}"
      end
      it " see project's name, materials, and theme of the challenge" do

        expect(page).to have_content("Name: #{@news_chic.name}")
        expect(page).to_not have_content("Name: #{@boardfit.name}")
        expect(page).to have_content("Material: #{@news_chic.material}")
        expect(page).to_not have_content("Material: #{@boardfit.material}")
        expect(page).to have_content("Theme: #{@recycled_material_challenge.theme}")
      end

      it " see count of contestatnts on the project" do

        expect(page).to have_content("Number of Contestants: 2")
      end
    end
  end
end