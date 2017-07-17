require 'rails_helper'

describe "An authenticated user" do
  it "can submit a new link" do
    user = create(:user)
    login(user)
    within(".form") do
      fill_in 'link_title', with: "Turing"
      fill_in 'link_url', with: "https://turing.io"
      click_on "Add your link!"
    end
    
    expect(page).to have_content("Title: Turing")
    expect(page).to have_content("URL: https://turing.io")
    expect(page).to have_content("Read? False")
  end
end