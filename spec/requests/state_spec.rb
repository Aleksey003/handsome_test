require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end

describe State do
    
    before (:each) do
        FactoryGirl.create(:admin_user)
        FactoryGirl.create(:country)
    end
    it 'should create new state' do
        cookied_login 
        visit new_state_path
        fill_in "state[title]", with: "my test state" 
        #fill_in "state[country_id]", with: Country.first
        select Country.first.title, from: "state[country_id]"
        click_on "Create State"
        page.should have_content("my test state")
    end
end