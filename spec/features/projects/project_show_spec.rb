require "rails_helper"

RSpec.describe Project do
	before(:each) do
		@recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
		@furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

		@news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
		@boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

		@upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
		@lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

		@jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
		@gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
		@kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
		@erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
		
		@jay_project_1 = ContestantProject.create!(contestant_id: @jay.id, project_id: @news_chic.id)
		@gretchen_project_1 = ContestantProject.create!(contestant_id: @gretchen.id, project_id: @news_chic.id)
		@gretchen_project_2 = ContestantProject.create!(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
		@kentaro_project_1 = ContestantProject.create!(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
		@kentaro_project_2 = ContestantProject.create!(contestant_id: @kentaro.id, project_id: @boardfit.id)
		@erin_project_1 = ContestantProject.create!(contestant_id: @erin.id, project_id: @boardfit.id)
  end

# User Story 1
# As a visitor
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
	it 'shows the projects name, material, and the challenge theme' do
		visit "/projects/#{@news_chic.id}"
		# save_and_open_page
		expect(page).to have_content("Project Name")
		expect(page).to have_content("Material")
		expect(page).to have_content("Challenge Theme")

		expect(page).to have_content(@news_chic.name)
		expect(page).to have_content(@news_chic.material)
		expect(page).to have_content(@recycled_material_challenge.theme)

		expect(page).to_not have_content(@boardfit.name)
		expect(page).to_not have_content(@boardfit.material)

		expect(page).to_not have_content(@upholstery_tux.name)
		expect(page).to_not have_content(@upholstery_tux.material)
	end

# User Story 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
	it 'shows a count of how many contestants are working on a project' do
		visit "/projects/#{@news_chic.id}"
		# save_and_open_page
		
		expect(page).to have_content("Number of Contestants")
		expect(page).to have_content(@news_chic.contestants.count)
	end
end