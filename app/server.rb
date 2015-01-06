require 'data_mapper'
require 'sinatra'
require './lib/cheeps'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require 'rack-flash'

enable :sessions
set :session_secret, 'super secret'
set :public_folder, Proc.new { File.join(root, '..', 'public') }


use Rack::Flash

get '/' do
	@cheeps = Cheep.all
	erb :index
end

get '/main' do
	@cheeps = Cheep.all
  	erb :main
end

post '/cheeps' do
	message = params["message"]
	@user = current_user
	Cheep.create(:message => message, :username => @user)
	redirect to('/main')
end

get '/users/new' do
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(:email => params[:email],
				:password => params[:password],
				:password_confirmation => params[:password_confirmation])
	# need to establish that user so can access and list user id.
	if @user.save
	session[:user_id] = @user.id
	redirect to('/')
	else
	flash.now[:errors] = @user.errors.full_messages
	erb :"/users/new"
	end
end

get '/sessions/new' do
	erb :"sessions/new"
end

post '/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)
	if user
		session[:user_id] = user.id
		redirect to('/main')
	else
		flash[:errors] = ["The email or password is incorrect"]
		erb :"sessions/new"
	end
end

delete '/sessions' do
	flash[:notice] = "Good bye!"
	session[:user_id] = nil
	redirect to('/')
end

get '/favourite/:id' do
	cheep = Cheep.first(:id => params[:id])
	cheep.like
	redirect '/main'
end