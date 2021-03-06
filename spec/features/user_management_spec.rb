require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do

	scenario "when being logged out" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, fadiehannona@gmail.com")
		expect(User.first.email).to eq("fadiehannona@gmail.com")
	end

	scenario "User clicks sign up button and is taken to the sign up page" do
		visit '/'
		click_button 'Sign up'
		expect(page).to have_content("Please sign up")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up('fadiehannona@gmail.com', 'vodka', 'whiskey')}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Password does not match the confirmation")
	end

	scenario "with an email that is already registered" do
		expect { sign_up }.to change(User, :count).by(1)
		expect { sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This email is already taken")
	end

end

feature "User signs in" do

	before(:each) do
		User.create(:email => "test@test.com",
					:password => 'test',
					:password_confirmation => 'test')
	end

	scenario "with correct credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Welcome, test@test.com")
	end

	scenario "with incorrect credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'wrong')
		expect(page).not_to have_content("Welcome, test@test.com")
	end

feature "User signs out" do

	before(:each) do
		User.create(:email => "test@test.com",
					:password => "test",
					:password_confirmation => "test")
	end

	scenario "while being signed in" do
		visit '/'
		sign_in("test@test.com", "test")
		save_and_open_page
		click_button "Sign out"
		expect(page).to have_content("Good bye!")
		expect(page).not_to have_content("Welcome, test@test.com")
	end

end
end