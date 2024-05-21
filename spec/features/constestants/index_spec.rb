require "rails_helper"

RSpec.describe "Constestant Index Page" do
    it "should show the names of all constants" do
        challenge1 = Challenge.create!(theme: "Apartment Furnishings")
        challenge2 = Challenge.create!(theme: "Fashion")

        project1 = Project.create!(name: "Litfit", material: "Lamp Shade", challenge: challenge1)
        project2 = Project.create!(name: "Rug Tuxedo", material: "Rug", challenge: challenge1)
        project3 = Project.create!(name: "LeatherFeather" , material: "Leather", challenge: challenge2)

        contestant1 = Contestant.create!(name: "Kentaro Kameyama")
        contestant2 = Contestant.create!(name: "Jay McCarroll")

        ContestantProject.create!(contestant: contestant1, project: project1)
        ContestantProject.create!(contestant: contestant1, project: project2)
        ContestantProject.create!(contestant: contestant2, project: project3)

        visit "/contestants"

        expect(page).to have_content("Kentaro Kameyama")
        expect(page).to have_content("Projects: Litfit, Rug Tuxedo")
        expect(page).to have_content("Jay McCarroll")
        expect(page).to have_content("Projects: LeatherFeather")
    end
end