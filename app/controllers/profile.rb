get '/profile/:username' do
	user = User.first(:username => params[:username])
	@user = user
	@cheeps = Cheep.all(:order => [ :id.desc ], :limit => 20)
	erb :profile
end