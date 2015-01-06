post '/cheeps' do
	message = params["message"]
	@user = current_user
	Cheep.create(:message => message, :username => @user.username)
	redirect to('/main')
end

get '/delete/:id' do
	cheep = Cheep.first(:id => params[:id])
	cheep.delete
	redirect '/main'
end