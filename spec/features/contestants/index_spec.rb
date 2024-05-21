require "rails_helper"

describe "Contestants Index Page" do
    describe "As a visitor" do

        it "I see a list of contestant names and I see a list of the projects names that they've been on" do
        recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

        upholstery_tux = furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

        jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)


        ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id)
        ContestantProject.create!(contestant_id: gretchen.id, project_id: upholstery_tux.id)

        visit "/contestants"
        within("#contestant-#{jay.id}") do
            expect(page).to have_content(jay.name)
            expect(page).to have_content("Project(s): News Chic")
        end

        within("#contestant-#{gretchen.id}") do
            expect(page).to have_content(gretchen.name)
            expect(page).to have_content("Project(s): News Chic, Upholstery Tuxedo")
        end
        end
    end
end
