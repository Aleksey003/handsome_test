require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end

describe Country do
    
    before (:each) do
        FactoryGirl.create(:admin_user)
    end
    it 'should create new country' do 
        cookied_login
        visit new_country_path
        fill_in "country[title]", with: "my test country" 
        click_on "Create Country"
        page.should have_content("my test country")
    end
end