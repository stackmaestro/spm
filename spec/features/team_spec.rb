require 'rails_helper'
require 'spec_helper'

describe "teams", type: :feature do
  context "index" do
    let!(:teams) { create_list(:team, 1, name: 'Unique Team')}

    it 'list all teams' do
      visit teams_path
      expect(page).to have_content teams.first.name
    end
  end

  context "create" do
    let!(:team) { create(:team)}
    it "create new team" do
      visit teams_path
      click_link 'Create Team'
      fill_in 'Name', with: 'Test Team'
      click_button 'Create Team'
      expect(page).to have_content team.name
    end
  end

  context "edit" do
    it 'edit team name' do
      visit teams_path
      click_link('Edit', :match => :first)
      fill_in "Name",	with: "Team Name Changed"
      click_button 'Update Team'
      expect(page).to have_content 'Team Name Changed'
    end
  end

  context "destroy" do
    it 'delete project' do
      team = create :team
      visit team_path(team)
      click_link 'Delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Deleted'
    end
  end
end
