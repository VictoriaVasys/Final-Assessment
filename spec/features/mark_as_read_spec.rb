require "rails_helper"

feature "Authenticated user", :js => :true do
  skip context "marks a link as read" do
    scenario "css changes and read status is changed to true" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      
      within first('.link .read-status') do
        expect(page).to have_text("false")
        
      end
      
      within first('.link') do
        click_on "Mark as Read"
      end
      expect(page).to have_css('.link-read')

      within first('.link-read .read-status') do
        expect(page).to have_text("true")
      end
    end
  end
  
  skip context "marks read link as unread" do
    scenario "css changes back to original and read-status is false" do
      user = create(:user_with_links)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
      
      within first('.link') do
        click_on "Mark as Read"
      end
      expect(page).to have_css('.link-read')

      within first('.link-read .read-status') do
        expect(page).to have_text("true")
      end
      
      within first('.link-read') do
        click_on "Mark as Unread"
        
        expect(page).to have_css('div.link')
      end

      within first('.link .read-status') do
        expect(page).to have_text("false")
      end

    end
  end
end
