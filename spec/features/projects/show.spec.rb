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
end