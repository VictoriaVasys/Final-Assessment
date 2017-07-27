require 'rails_helper'

feature "An authenticated user", :js => :true do
  scenario "can submit a new link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path
    within("form") do
      fill_in 'link_title', with: "Turing"
      fill_in 'link_url', with: "https://turing.io"
      click_on "Add your link!"
    end
    
    expect(page).to have_content("Title: Turing")
    expect(page).to have_content("URL: https://turing.io")
    expect(page).to have_content("Read? false")
  end
  
  skip context "does not enter link title" do
    scenario "receives alert that link wasn't created" do
      Capybara.default_max_wait_time = 5
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      within("form") do
        fill_in 'link_title', with: ""
        fill_in 'link_url', with: "https://turing.io"
        click_on "Add your link!"
      end
      
      text = page.driver.browser.switch_to.alert.text
      expect(text).to have_content("Failed to add your link; ")

    end
  end
  
  skip context "does not enter a url" do
    scenario "receives alert that link wasn't created" do
      Capybara.default_max_wait_time = 5
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      within("form") do
        fill_in 'link_title', with: "wowwww"
        fill_in 'link_url', with: ""
        click_on "Add your link!"
      end
      
      text = page.driver.browser.switch_to.alert.text
      expect(text).to have_content("Failed to add your link; ")

    end
  end
  
  skip context "enters an invalid url" do
    scenario "receives alert that link wasn't created" do
      Capybara.default_max_wait_time = 5
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      within("form") do
        fill_in 'link_title', with: "Hi!"
        fill_in 'link_url', with: "turing.io"
        click_on "Add your link!"
      end
      
      text = page.driver.browser.switch_to.alert.text
      expect(text).to have_content("Failed to add your link; ")

    end
  end
end