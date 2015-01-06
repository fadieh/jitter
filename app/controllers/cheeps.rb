post '/cheeps' do
	message = params["message"]
	@user = current_user
	Cheep.create(:message => message, :email => @user.email)
	redirect to('/main')
end