require 'rails_helper'

feature "An authenticated user", :js => :true do
  skip scenario "can edit a link" do
    user = create(:user_with_links)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path
    
    within first('.link') do
      find_button('Edit Link').click
      sleep 1
      element = find(".title").base.send_keys("fab link")
      # element.set("fab link")
      # element.native.send_keys(:return)
      # fill_in 'Title', with: 'fabulous link'
      # fill_in 'Url', with: 'https://www.fabulous.com'
    end
    
    find_button('Update Link').click
    
    expect(page).to have_content("Title: fab link")
    expect(page).to have_content("URL: #{user.links.first.url}")
    expect(page).to have_content("Link updated successfully")
  end
  
  skip context "user doesn't submit a title" do 
    scenario "should return a flash failure" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit links_path
      within first('.link') do
        click_on('Edit Link')
      end
      fill_in 'Title', with: ''
      fill_in 'Url', with: 'https://www.fabulous.com'
      click_on "Update Link"
      
      expect(page).to have_content("Title: #{user.links.first.title}")
      expect(page).to have_content("URL: #{user.links.first.url}")
      expect(page).to have_content("Link could not be updated; ")
    end
  end
  
  skip context "user doesn't submit a url" do 
    scenario "should return a flash failure" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit links_path
      within first('.link') do
        click_on('Edit Link')
      end
      fill_in 'Title', with: 'fab link'
      fill_in 'Url', with: ''
      click_on "Update Link"
      
      expect(page).to have_content("Title: #{user.links.first.title}")
      expect(page).to have_content("URL: #{user.links.first.url}")
      expect(page).to have_content("Link could not be updated; ")
    end
  end
  
  skip context "user submits an invalid url" do 
    scenario "should return a flash failure" do
      Capybara.default_max_wait_time = 5

      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit links_path
      within first('.link') do
        click_on('Edit Link')
      end

      within first('.link') do
        element = find(:xpath, "//div[@contenteditable='true' and @class='title']")
        element.set("fab link")
        element.native.send_keys(:return)
        # fill_in '.title', with: 'fab link'
        # fill_in '.url', with: 'www.fabulous.com'
        click_on "Update Link"
      end
      
      expect(page).to have_content("Title: #{user.links.first.title}")
      expect(page).to have_content("URL: #{user.links.first.url}")
      expect(page).to have_content("Link could not be updated; ")
    end
  end
end