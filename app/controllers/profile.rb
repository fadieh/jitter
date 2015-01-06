get '/profile/:username' do
	user = User.first(:username => params[:username])
	@user = user
	erb :profile
end