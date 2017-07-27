require 'rails_helper'

feature "An authenticated user" do
  it "can edit a link" do
    user = create(:user_with_links)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path
    
    within first('.link') do
      click_on('Edit')
    end
    expect(current_path).to eq(edit_link_path(link))
    
    fill_in 'Title', with: 'fabulous link'
    fill_in 'Url', with: 'https://www.fabulous.com'
    click_on "Submit"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Title: fabulous link")
    expect(page).to have_content("URL: https://www.fabulous.com")
    expect(page).to have_content("Link updated successfully")
  end
end