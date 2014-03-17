require 'spec_helper'
Capybara.default_driver = :selenium

def cookied_login
    visit new_user_session_path
    fill_in "user[email]", with: 'user@user.com'
    fill_in "user[password]", with: '12345678'
    click_on 'Sign in'
    page.should have_content('user@user.com')
end


describe Hotel do
    
    before (:each) do
        6.times do |i| 
            FactoryGirl.create(:hotel,title: "hotel #{i}", avg_rating: i)
        end
        FactoryGirl.create(:admin_user)
    end
    context 'root page' do 
        it 'in root page should be 5 hotels' do     
            visit '/'
            page.all('h2.hotel_title').count.should eql(5)
        end

        it 'in root page first element should be "hotel 5"' do
            visit '/' 
            first_title = find(:xpath, "html/body/div[2]/div/div/ul/li[1]/h2/a")
            first_title.should have_content('hotel 5')
        end

        it 'in root page last element should be "hotel 1"' do 
            visit '/'
            last_title = find(:xpath, "html/body/div[2]/div/div/ul/li[5]/h2/a")
            last_title.should have_content('hotel 1')
        end
    end

    context 'hotel request' do
        it 'should have new hotel link' do 
            cookied_login
            visit hotels_path
            page.should have_link('New Hotel', href: new_hotel_path)
        end

        it 'should create new hotel' do
            cookied_login
            visit new_hotel_path
            fill_in 'hotel[title]', with: 'my test hotel'
            fill_in 'hotel[room_description]', with: 'my test hotel description'
            fill_in 'hotel[price_for_room]', with: 400
            check 'hotel[breakfast_included]'
            click_on 'Create Hotel'
            page.should have_content('my test hotel')
            page.should have_content('my test hotel description')
            page.should have_content('price - 400.0')
            page.should have_content('breakfast - true')
        end
    end
    
end