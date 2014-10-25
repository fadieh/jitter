require 'data_mapper'
require 'sinatra'
require './lib/cheeps'

env = ENV["RACK_ENV"] || "development" # checking the environment we're in, default to development.

DataMapper.setup(:default, "postgres://localhost/jitter_#{env}") # select database based on environment

# then in spec helper, we specify the environment so the tests we're using are using the right database.

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
	@cheeps = Cheep.all
	erb :index
end