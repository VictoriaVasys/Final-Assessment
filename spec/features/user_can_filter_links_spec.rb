require 'rails_helper'

feature "Authenticated user", :js => :true do
  attr_reader :user
  before do
    @user = create(:user_with_links)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path
  end
  
  scenario "can filter links by keystroke" do

    fill_in "query", with: "LI"

    expect(page).to have_content(user.links.first.title)
    expect(page).to have_content(user.links.find(2).title)
    expect(page).to have_content(user.links.last.title)

    fill_in "query", with: "#{user.links.first.title}"

    expect(page).to have_content(user.links.first.title)
    expect(page).to_not have_content(user.links.find(2).title)
    expect(page).to_not have_content(user.links.last.title)
  end
  
  skip context "clicks 'show read links'" do
    scenario "all read links shown" do
      user.links.first.update(read:true)
      
      click_on "Show Read Links"

      expect(page).to have_content(user.links.first.title)
      expect(page).to_not have_content(user.links.find(2).title)
      expect(page).to_not have_content(user.links.last.title)
    end
  end
  
  skip context "clicks 'show unread links'" do
    scenario "all unread links shown" do
      user.links.first.update(read:true)
      
      click_on "Show Unread Links"

      expect(page).to_not have_content(user.links.first.title)
      expect(page).to have_content(user.links.find(2).title)
      expect(page).to have_content(user.links.last.title)
    end
  end
end