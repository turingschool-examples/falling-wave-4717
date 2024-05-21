require "rails_helper"

describe "project show page" do
    describe "when I visit a project's show page" do
        it "I see the project's name, material, and theme of the challenge" do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("Project Name: #{news_chic.name}")
        expect(page).to have_content("Project Material: #{news_chic.material}")
        expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
        end
    end
end