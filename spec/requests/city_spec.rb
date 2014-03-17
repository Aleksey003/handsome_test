require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end

describe City do
    
    before (:each) do
        FactoryGirl.create(:admin_user)
        FactoryGirl.create(:state)
    end
    it 'should create new city' do
        cookied_login 
        visit new_city_path
        fill_in "city[title]", with: "my test city" 
        select State.first.title, from: "city[state_id]"
        click_on "Create City"
        page.should have_content("my test city")
    end
end