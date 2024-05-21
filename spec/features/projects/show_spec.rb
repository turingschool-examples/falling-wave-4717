require 'rails_helper'

RSpec.describe 'projects show ', type: :feature do
  describe 'as a user' do
    let(:project) do
      recycled_material_challenge = Challenge.create!(theme: 'Recycled Material', project_budget: 1000)
      recycled_material_challenge.projects.create!(name: 'News Chic', material: 'Newspaper')
    end

    scenario 'when I visit a project show page, I should see' do
      visit "/projects/#{project.id}"

      expect(page).to have_content(project.name)
      expect(page).to have_content(project.material)
      expect(page).to have_content(project.challenge.theme)
    end
  end
end
