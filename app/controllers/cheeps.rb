post '/cheeps' do
	message = params["message"]
	@user = current_user
	Cheep.create(:message => message, :username => @user.username)
	redirect to('/main')
end