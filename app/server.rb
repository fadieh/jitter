require 'data_mapper'
require 'sinatra'
require './lib/cheeps'
require './lib/user'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'

enable :sessions
set :session_secret, 'super secret'

env = ENV["RACK_ENV"] || "development" # checking the environment we're in, default to development.

DataMapper.setup(:default, "postgres://localhost/jitter_#{env}") # select database based on environment

# then in spec helper, we specify the environment so the tests we're using are using the right database.

DataMapper.finalize

DataMapper.auto_upgrade!

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
	User.create(:email => params[:email],
				:password => params[:password])
	session[:user_id] = user.id
	redirect to('/')
end