require "rails_helper"

describe "As a visitor" do
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
  
  scenario "user doesn't enter a password" do
    visit "/"  
    click_on "Sign up by clicking here."
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[email]", with: "vic@vasys.com"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Complete sign up!"
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Could not create account because Password can't be blank")
  end
  
  scenario "user doesn't enter an email" do
    visit "/"  
    click_on "Sign up by clicking here."
    
    expect(current_path).to eq(sign_up_path)
    
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Complete sign up!"
    
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_content("Could not create account because Email can't be blank")
  end

  scenario "user doesn't enter a password confirmation" do
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










