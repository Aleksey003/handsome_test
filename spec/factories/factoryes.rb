FactoryGirl.define do
	factory :user do
		sequence(:email) {|n| "user#{n}@user.com"}
		password 12345678
	end

	factory :admin_user, parent: :user do 
		email "user@user.com"
	end

	factory :hotel do
		sequence(:title) {|n| "hotel #{n}"}
		room_description "description"
	end

	factory :comment do
		user { |c| c.association(:user) }
		hotel {|c| c.association(:hotel)}
		comment_text "comment 1"
		rating 1
	end

	factory :country do 
		title "title country"
	end

	factory :state do 
		title "title state"
		country {|c| c.association(:country)}
	end

	factory :city do 
		title "title city"
		state {|c| c.association(:state)}
	end

	factory :street do 
		title "title streer"
		city  {|c| c.association(:city)}
	end

end