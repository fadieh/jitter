require 'spec_helper'

feature "User signs up" do

	scenario "when being logged out" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, fadiehannona@gmail.com")
		expect(User.first.email).to eq("fadiehannona@gmail.com")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up('fadiehannona@gmail.com', 'vodka', 'whiskey')}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	def sign_up(email = "fadiehannona@gmail.com",
				password = "vodka",
				password_confirmation = "vodka")
	visit '/users/new'
	expect(page.status_code).to eq(200)
	fill_in :email, :with => email
	fill_in :password, :with => password
	fill_in :password_confirmation, :with => password_confirmation
	click_button "Sign up"
	end

end