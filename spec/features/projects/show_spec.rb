require "rails_helper"

RSpec.describe "Project Show Page" do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  end

  describe "As a visitor" do
    describe "When I visit the project's show page" do
      it "shows the project's name and material" do
        visit("/projects/#{@news_chic.id}")

        expect(page).to have_content(@news_chic.name)
        expect(page).to have_content("Material: #{@news_chic.material}")
      end

      it "shows the theme of the challenge the project belongs to" do
        visit("/projects/#{@news_chic.id}")

        expect(page).to have_content(@recycled_material_challenge.theme)
      end
    end
  end
end