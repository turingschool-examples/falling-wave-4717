require 'rails_helper'

RSpec.describe 'Contestand Index', type: :feature do
  describe 'as a user' do
    it 'when I visit contestant index page, I should see' do
      recycled_material_challenge = Challenge.create(theme: 'Recycled Material', project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: 'News Chic', material: 'Newspaper')
      jay = Contestant.create(name: 'Jay McCarroll', age: 40, hometown: 'LA', years_of_experience: 13)
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

      visit '/contestants'
      save_and_open_page
      expect(page).to have_content(jay.name)
      expect(page).to have_content(jay.projects.first.name)
    end
  end
end
