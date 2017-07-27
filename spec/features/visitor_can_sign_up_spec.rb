require "rails_helper"

feature "As a visitor" do
  scenario "user can sign up" do
    visit "/"  
    click_on "Sign up by clicking here."
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Complete sign up!"
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("You successfully created an account!")
  end
  
  context "user doesn't enter a password" do
    scenario "they receive a flash message why their account couldn't be created" do
      visit "/"  
      click_on "Sign up by clicking here."
      
      expect(current_path).to eq(sign_up_path)
      
      fill_in "user[email]", with: "vic@vasys.com"
      fill_in "user[password_confirmation]", with: "123"
      click_on "Complete sign up!"
      expect(current_path).to eq(sign_up_path)
      expect(page).to have_content("Could not create account because Password can't be blank")
    end
  end
  
  context "user doesn't enter a email" do
    scenario "they receive a flash message why their account couldn't be created" do
      visit "/"  
      click_on "Sign up by clicking here."
      
      expect(current_path).to eq(sign_up_path)
      
      fill_in "user[password]", with: "123"
      fill_in "user[password_confirmation]", with: "123"
      click_on "Complete sign up!"
      
      expect(current_path).to eq(sign_up_path)
      expect(page).to have_content("Could not create account because Email can't be blank")
    end
  end

  context "user doesn't enter a password confirmation" do
    scenario "they receive a flash message why their account couldn't be created" do
      visit "/"  
      click_on "Sign up by clicking here."
      
      expect(current_path).to eq(sign_up_path)
      
      fill_in "user[email]", with: "vic@vasys.com"
      fill_in "user[password]", with: "123"
      click_on "Complete sign up!"
      expect(current_path).to eq(sign_up_path)
      expect(page).to have_content("Could not create account because Password confirmation doesn't match Password")
    end
  end
end










