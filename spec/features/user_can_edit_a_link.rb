require 'rails_helper'

feature "An authenticated user", :js => :true do
  scenario "can edit a link" do
    user = create(:user_with_links)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path
        
    within first('.link') do
      find_button('Edit Link').click
      element = find(".title").base.send_keys(" fab link")
    end
    
    find_button('Update Link').click
    
    within first('.link') do
      expect(page).to have_content("Title: #{user.links.last.title} fab link")
      expect(page).to have_content("URL: #{user.links.last.url}")
    end
    expect(page).to have_content("Link updated successfully")
  end
  
  context "user submits an invalid url" do 
    scenario "should return a flash failure" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit links_path
      within first('.link') do
        click_on('Edit Link')
        element = find(".url").base.send_keys(" fab link")
      end
      
      find_button('Update Link').click
      
      within first('.link') do
        expect(page).to have_content("Title: #{user.links.last.title}")
        expect(page).to have_content("URL: #{user.links.last.url}")
      end
      expect(page).to have_content("Failed to update your link; ['Url Not a Valid URL']")
    end
  end
  
end