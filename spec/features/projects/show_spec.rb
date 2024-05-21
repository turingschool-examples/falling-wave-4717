require "rails_helper"

RSpec.describe "Project#Show" do

    describe "shows the project" do
        it "should show the project" do
            challenge = Challenge.create!(theme: "Apartment Furnishings")
            project = Project.create!(name: "Litfit", material: "Lamp Shade", challenge: challenge)
            
            visit "/projects/#{project.id}"

            expect(page).to have_content("Litfit")
            expect(page).to have_content("Material: Lamp Shade")
            expect(page).to have_content("Challenge: Apartment Furnishings")
        end
    end

    describe "Counting the contestants" do
        it "should show the number of contestants" do
            challenge = Challenge.create!(theme: 'Apartment Furnishings')
            project = Project.create!(name: 'Litfit', material: 'Lamp Shade', challenge: challenge)
            
            contestant1 = Contestant.create!(name: 'Contestant 1')
            contestant2 = Contestant.create!(name: 'Contestant 2')
            contestant3 = Contestant.create!(name: 'Contestant 3')
            
            ContestantProject.create!(contestant: contestant1, project: project)
            ContestantProject.create!(contestant: contestant2, project: project)
            ContestantProject.create!(contestant: contestant3, project: project)

            visit "/projects/#{project.id}"

            expect(page).to have_content("Litfit")
            expect(page).to have_content("Material: Lamp Shade")
            expect(page).to have_content("Challenge: Apartment Furnishings")
            expect(page).to have_content("Number of Contestants: 3")
        end
    end
end