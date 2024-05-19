require "rails_helper"

RSpec.describe "Contestants Index Page" do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
  end

  describe "As a visitor" do
    describe "When I visit the contestants index page" do
      it "shows a list of all names of contestants" do
        visit("/contestants")

        within("div#contestants") do
          expect(page).to have_content(@jay.name)
          expect(page).to have_content(@gretchen.name)
        end
      end

      it "shows the project's name the contestant has been working on" do
        visit("/contestants")

        expect(page).to have_content(@news_chic.name)
        expect(page).to have_content(@upholstery_tux.name) #still inside pluck array
        save_and_open_pageo
      end
    end
  end
end