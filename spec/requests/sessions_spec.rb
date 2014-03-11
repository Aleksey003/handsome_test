require 'spec_helper'

describe "new sessions" do 
    before(:each) do 
        FactoryGirl.create(:admin_user)
    end
    it 'should be login' do
        visit new_user_session_path
        fill_in "user[email]", with: 'user@user.com'
        fill_in "user[password]", with: '12345678'
        click_on 'Sign in'
        page.should have_content('user@user.com')
    end
end