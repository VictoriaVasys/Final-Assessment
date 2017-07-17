require 'rails_helper'

describe "registered user" do
  it "can log out after signing in" do
    user = create(:user)

    login(user)

    expect(page).to_not have_content("Log In")
    click_on "Sign Out"
    expect(current_path).to eq(root_path)
  end
end