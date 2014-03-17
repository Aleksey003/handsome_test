require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end

describe Street do
    
    before (:each) do
        FactoryGirl.create(:admin_user)
        FactoryGirl.create(:city)
    end
    it 'should create new street' do 
        cookied_login
        visit new_street_path
        fill_in "street[title]", with: "my test street" 
        select City.first.title, from: "street[city_id]"
        click_on "Create Street"
        page.should have_content("my test street")
    end
end