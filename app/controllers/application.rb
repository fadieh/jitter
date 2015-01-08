get '/' do
	@cheeps = Cheep.all
	erb :index
end

get '/main' do
	@cheeps = Cheep.all(:order => [ :id.desc ], :limit => 20)
  	erb :main
end