require 'spec_helper'
Capybara.default_driver = :selenium

describe Hotel do
    before (:each) do
        6.times do |i| 
            Hotel.create!(title: "hotel #{i}", avg_rating: i)
        end
    end
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