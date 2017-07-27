require 'rails_helper'

feature "An authenticated user", :js => :true do
  scenario "can submit a new link" do
    user = create(:user)
    login(user)
    within(".form") do
      fill_in 'link_title', with: "Turing"
      fill_in 'link_url', with: "https://turing.io"
      click_on "Add your link!"
    end
    
    expect(page).to have_content("Title: Turing")
    expect(page).to have_content("URL: https://turing.io")
    expect(page).to have_content("Read? false")
  end
  
  context "does not enter link title" do
    scenario "receives alert that link wasn't created" do
      user = create(:user)
      login(user)
      within(".form") do
        fill_in 'link_title', with: ""
        fill_in 'link_url', with: "https://turing.io"
        click_on "Add your link!"
      end
      
      expect(page).to have_content("Failed to add your liiink; ")
    end
  end
end