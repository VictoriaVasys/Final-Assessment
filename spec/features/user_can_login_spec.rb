require "rails_helper"

RSpec.describe "As an authenticated user" do
  scenario "user can login" do
    user = create(:user)
    visit "/"
  save_and_open_page
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on "Log In"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Log in successful")
  end
  
end