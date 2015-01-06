get '/' do
	@cheeps = Cheep.all
	erb :index
end

get '/main' do
	@cheeps = Cheep.all
  	erb :main
end