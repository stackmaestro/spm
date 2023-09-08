require 'rails_helper'
require 'spec_helper'

describe "team members", type: :feature do
  context "index" do
    let!(:team) { create_list(:team, 1, name: 'Unique Team')}

    it 'lists all teams' do
      visit team_members_path(team)
      expect(page).to have_content 'Create Members'
    end
  end

  context "create" do
    let!(:team) { create(:team)}

    it "creates a new team member" do
      visit team_members_path(team)
      click_link 'Create Members'
      fill_in 'First name', with: 'Test member'
      fill_in 'Last name', with: 'Member'
      find(:select, "member_team_id", visible: false).send_keys :enter, :down, :enter
      click_button 'Create Member'
      expect(page).to have_content 'Test member'
    end
  end

  context "edit" do
    let!(:team) { create(:team)}

    it 'edits a team member name' do
      visit team_members_path(team)
      click_link('Edit' , :match => :first)
      fill_in "First name",	with: "Name Changed"
      click_button 'Update Member'
      save_and_open_screenshot
      expect(page).to have_content 'Name Changed'
    end
  end

  context "destroy" do
    let!(:team) { create(:team)}

    it 'deletes a project' do
      visit team_members_path(team)
      click_link('Delete', :match => :first)
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Deleted'
      save_and_open_screenshot
    end
  end
end
