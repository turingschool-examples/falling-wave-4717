require "rails_helper"

RSpec.describe "the project show page" do
    before(:each) do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    end

    it "displays the project" do
    
    visit "projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to_not have_content(@boardfit.name)
    end

    it "displays the material and them" do

    visit "projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.material)
    expect(page).to have_content(@news_chic.challenge.theme)
    end
end