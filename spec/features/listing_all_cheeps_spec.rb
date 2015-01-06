require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User browses the list of cheeps" do

  before(:each) {
    Cheep.create(:message => "Hello World",
                :username => "Fadie")
    User.create(:email => "test@test.com",
				:password => 'test',
				:password_confirmation => 'test')
  }

  scenario "When opening the home page" do
    visit '/'
    expect(page).to have_content("Hello World")
  end

  	scenario "can favourite a cheep" do
		visit '/'
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Hello World Fadie 0")
		click_link 'Favourite'
		expect(page).to have_content("Hello World Fadie 1")
	end

end