require 'rails_helper'
require 'spec_helper'

describe "projects", type: :feature do
  context "index" do
    let!(:projects) { create_list(:project, 1, name: 'Unique Project')}

    it 'lists all projects' do
      visit projects_path
      expect(page).to have_content projects.first.name
    end
  end

  context "create" do
    it "create project" do
      visit projects_path
      click_link 'Create Project'
      fill_in 'Name', with: 'Test Name'
      click_button 'Create Project'
      expect(page).to have_content 'Test Name'
    end
  end

  context "edit" do
    let!(:project) { create(:project)}

    it 'edit project name' do
      visit edit_project_path(project)
      save_and_open_screenshot
      find_field('Name').set('Name Changed')
      click_button 'Update Project'
      expect(page).to have_content 'Name Changed'
    end
  end

  context "destroy" do
    let!(:project) { create(:project, name: 'Deleteable')}

    it 'delete project' do
      visit project_path(project)
      click_link 'Delete'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Deleted'
      save_and_open_screenshot
    end
  end
end
