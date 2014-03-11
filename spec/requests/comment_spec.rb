require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
  visit new_user_session_path
  fill_in "user[email]", with: 'user@user.com'
  fill_in "user[password]", with: '12345678'
  click_on 'Sign in'
end

describe Comment do
  before(:each) do 
    FactoryGirl.create(:comment, comment_text: 'comment 1', rating: 3)
    FactoryGirl.create(:admin_user)
  end
  it 'should create new comment' do
    cookied_login
    visit hotel_path(Hotel.first)   
    fill_in 'comment[comment_text]', with: 'my test comment'
    choose '4'    
    click_on 'Create Comment'
    page.should have_content('4')
    page.should have_content('my test comment')    
  end

  it "rating cant'n be blank" do
    cookied_login
    visit hotel_path(Hotel.first)
    fill_in 'comment[comment_text]', with: 'my test comment'
    click_on 'Create Comment'
    page.should_not have_content('my test comment') 
    page.should have_content("Comment don't created")  
  end

end