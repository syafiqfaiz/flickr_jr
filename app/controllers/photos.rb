namespace '/photos' do

  get '/upload' do
    @user = User.find(session[:id])
    @albums = @user.albums
    erb :'/photos/upload_photo'
  end

  post '/create' do
      album = Album.find(params[:album_id])
      @photo = album.photos.build
      @photo.source = params[:file_path]
      if @photo.save
        redirect "/albums/#{album.id}/photos/#{@photo.id}"
      else
        session[:errors] = "failed to save photo"
        redirect "/photos/new"
      end
    end

    get "/:id" do
      @photo = Photo.find(params[:id])

      erb :'/photos/view_one'
    end

end