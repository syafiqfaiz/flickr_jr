namespace '/albums' do

  get "/create_album" do

    erb :"/albums/create_album"
  end

  post "/create_album" do
    @current_user = User.find(session[:id])
    @current_user.albums.create(name: params[:name], description: params[:description])

    redirect "/users/#{session[:id]}"
  end

  get '/:id' do
    album = Album.find(params[:id])
    @photos = album.photos

    erb :"/photos/view_multiple"
  end


  get '/:album_id/photos/:photo_id' do
    @photo = Photo.find(params[:photo_id])

    erb :'photos/view_one'
  end


end