require 'rails_helper'

describe "An authenticated user" do
  it "can submit a new link" do
    user = create(:user_with_links)
    login(user)
    
#     And I click on "Edit" (button),
    # I should be redirected (or fill in there)
    # And I change the content,
    # And I click submit (or outside the editable box),
    # I should see a flash msg for success or reason why edit was invalid.
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