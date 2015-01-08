module SessionHelpers

	def sign_in(email, password)
		visit '/sessions/new'
		fill_in 'email', :with => email, :match => :smart
		fill_in 'password', :with => password, :match => :smart
		click_button 'Sign in'
	end

	def sign_up(email = "fadiehannona@gmail.com",
				password = "vodka",
				password_confirmation = "vodka")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up", :match => :prefer_exact
	end

	def post_cheep(message)
		visit '/main'
		fill_in :message, :with => message
		click_button "Add cheep"
	end

end