require "rails_helper"

RSpec.describe "The Contestant Index Page" do
    before(:each) do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000,)

        @news_chic = Project.create(name: "News Chic", material: "Newspaper", challenge_id: @recycled_material_challenge.id)
        @boardfit = Project.create(name: "Boardfit", material: "Cardboard Boxes", challenge_id: @recycled_material_challenge.id)

        @upholstery_tux = Project.create(name: "Upholstery Tuxedo", material: "Couch", challenge_id: @furniture_challenge.id)
        @lit_fit = Project.create(name: "Litfit", material: "Lamp", challenge_id: @furniture_challenge.id)

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
        @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
        ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    end

    describe "As a visitor" do
        describe "when I visit the contestants index page" do
            describe "I see a list of all the contestant names" do
                it "can show all the contestants names" do

                    visit "/contestants"
                    
                    expect(page).to have_content("#{@jay.name}")
                    expect(page).to have_content("#{@gretchen.name}")
                    expect(page).to have_content("#{@kentaro.name}")
                    expect(page).to have_content("#{@erin.name}")
                end
            end

            describe "and under each contestants name I see a list of the projects (names) that they've been on" do
                it "can list of project names under contestant names" do

                    visit "/contestants"

                    expect(page).to have_content("#{@news_chic.name}")
                    expect(page).to have_content("#{@upholstery_tux.name}")
                    expect(page).to have_content("#{@boardfit.name}")
                    expect(page).to_not have_content("#{@lit_fit.name}")
                end
            end
        end
    end
end

