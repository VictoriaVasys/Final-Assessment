require 'rails_helper'

feature "As an authenticated user" do
  it "can log out after logging in" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path

    expect(current_path).to eq(links_path)
    expect(page).to_not have_button("Log In")
    
    click_on "Sign Out"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_button("Log In")
  end
end