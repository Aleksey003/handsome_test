require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end

describe Asset do 
    it "should create asset" do 
        hotel = FactoryGirl.create(:hotel)
        visit edit_hotel_path(hotel)

        script = "$('input[type=file]').show();"
        page.driver.browser.execute_script(script)
    end
end