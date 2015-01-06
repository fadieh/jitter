get '/favourite/:id' do
	cheep = Cheep.first(:id => params[:id])
	cheep.like
	redirect '/main'
end