require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

before(:each) {
    User.create(:email => "test@test.com",
				:password => 'test',
				:password_confirmation => 'test')
				}

feature "User adds a new cheep" do
	scenario "when browsing the homepage" do
		vist '/'
		expect(Cheep.count).to eq(0)
		sign_in('test@test.com', 'test')
		visit '/main'
		add_cheep("Hello world")
		expect(Cheep.count).to eq(1)
		cheep = Cheep.first
		expect(cheep.message).to eq("Hello world")
	end

	def add_cheep(message)
		within('#new-cheep') do
			fill_in 'message', :with => message
			click_button 'Add cheep'
		end
	end
end