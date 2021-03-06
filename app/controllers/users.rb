get '/users/new' do
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(:username => params[:username],
				:email => params[:email],
				:password => params[:password],
				:password_confirmation => params[:password_confirmation],
				:first_name => params[:first_name],
				:second_name => params[:second_name])
	if @user.save
	session[:user_id] = @user.id
	redirect to('/main')
	else
	flash.now[:errors] = @user.errors.full_messages
	erb :"/users/new"
	end
end