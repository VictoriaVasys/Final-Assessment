require "rails_helper"

RSpec.describe "As a visitor" do
  scenario "user can sign up" do
    visit "/"  
    click_on "Sign up by clicking here."
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Complete sign up!"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("You successfully created an account!")

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end