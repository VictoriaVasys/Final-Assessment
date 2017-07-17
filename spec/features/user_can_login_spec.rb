require "rails_helper"

RSpec.describe "As an authenticated user" do
  scenario "user can login" do
    user = create(:user)
    visit "/"
    within("form") do
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_on "Log In"
    end
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Log in successful")
  end
  
  scenario "user gets a flash message with unsuccessful login" do
    user = create(:user)
    visit "/"
    within("form") do
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
      click_on "Log In"
    end
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Log in successful")
  end
  
end