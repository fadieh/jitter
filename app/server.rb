require 'data_mapper'
require 'sinatra'
require './lib/cheeps'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'

enable :sessions
set :session_secret, 'super secret'

get '/' do
	@cheeps = Cheep.all
	erb :index
end

post '/cheeps' do
	message = params["message"]
	Cheep.create(:message => message)
	redirect to('/')
end

get '/users/new' do
	erb :"users/new"
end

post '/users' do
	@user = User.create(:email => params[:email],
				:password => params[:password],
				:password_confirmation => params[:password_confirmation])
	# need to establish that user so can access and list user id.
	session[:user_id] = @user.id
	redirect to('/')
end