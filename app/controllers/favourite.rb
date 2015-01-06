get '/favourite/:id' do
	cheep = Cheep.first(:id => params[:id])
	if current_user
	cheep.like
	redirect '/main'
	else 
	flash[:notice] = "You must be signed in to do that."
	redirect '/main'
end
end