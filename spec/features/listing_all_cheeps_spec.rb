require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User browses the list of cheeps" do

  before(:each) {
    User.create(:email => "test@test.com",
				:password => 'test',
				:password_confirmation => 'test')
    Cheep.create(:message => "Hello World",
                :email => "test@test.com")
  }

  scenario "When opening the home page" do
    visit '/'
    expect(page).to have_content("Hello World")
  end

  	scenario "can favourite a cheep" do
		visit '/'
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Hello World test@test.com 0")
		click_link 'Favourite'
		expect(page).to have_content("Hello World test@test.com 1")
	end

	scenario "username shows up on cheep" do
		visit '/'
		sign_in('test@test.com', 'test')
		post_cheep("Hello world")
		expect(page).to have_content("Hello World test@test.com")
	end

end