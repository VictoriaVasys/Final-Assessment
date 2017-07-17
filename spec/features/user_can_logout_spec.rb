require 'rails_helper'

describe "As an authenticated user" do
  it "can log out after logging in" do
    user = create(:user)
    login(user)

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content("Log In")
    click_on "Sign Out"
    expect(current_path).to eq(root_path)
  end
end