get '/' do
	@cheeps = Cheep.all
	erb :index
	if current_user
		redirect ('/main')
	end
end

get '/main' do
	@cheeps = Cheep.all(:order => [ :id.desc ], :limit => 20)
  	erb :main
end