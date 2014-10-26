require 'spec_helper'

feature "User signs up" do

	scenario "when being logged out" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, fadiehannona@gmail.com")
		expect(User.first.email).to eq("fadiehannona@gmail.com")
	end

	def sign_up(email = "fadiehannona@gmail.com",
				password = "vodka")
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :email, :with => email
	fill_in :password, :with => password
	click_button "Sign up"
	end

end