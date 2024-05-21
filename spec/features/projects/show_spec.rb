require "rails_helper"

describe "project show page" do
    describe "when I visit a project's show page" do
        it "I see the project's name, material, and theme of the challenge" do
            recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

            news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

            visit "/projects/#{news_chic.id}"

            expect(page).to have_content("Project Name: #{news_chic.name}")
            expect(page).to have_content("Project Material: #{news_chic.material}")
            expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
        end

        it "I see a count of the number of contestants on this project" do
            recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

            news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

            jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

            ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id)
            ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id)

            visit "/projects/#{news_chic.id}"

            expect(page).to have_content("Number of Contestants: 2")
        end
        it "I see the average years of experience for the contestants that worked on that project" do
            recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

            news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")

            jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

            ContestantProject.create!(contestant_id: jay.id, project_id: news_chic.id)
            ContestantProject.create!(contestant_id: gretchen.id, project_id: news_chic.id)

            visit "/projects/#{news_chic.id}"

            expect(page).to have_content("Average Contestant Experience: 12.5 years")
        end
    end
end