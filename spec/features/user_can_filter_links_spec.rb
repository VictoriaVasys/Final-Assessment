require 'rails_helper'

describe "Authenticated user", :js => :true do
  it "can filter links by keystroke" do
    user = create(:user_with_links)

    fill_in "query", with: "LI"

    expect(page).to have_content(user.links.first.title)
    expect(page).to have_content(user.links.find(2).title)
    expect(page).to have_content(user.links.last.title)

    fill_in "query", with: "#{user.links.first.title}"

    expect(page).to have_content(user.links.first.title)
    expect(page).to_not have_content(user.links.find(2).title)
    expect(page).to_not have_content(user.links.last.title)
  end
end