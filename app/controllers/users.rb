namespace '/users' do
  get '/create' do

    erb :'/users/create_user'
  end


  post '/create_user' do
    @user = User.create(name: params[:name], username: params[:username], email:params[:email], password: params[:password])
    @user.albums.create(name: 'default album')

    erb :'/users/create_user_success'
  end

  get '/sign_up' do

    erb :'/users/sign_up'
  end

  get '/login' do
    erb :'/users/login'
  end


  post '/login' do

    @user = User.authenticate(params[:email], params[:password])
     if @user
       session[:id] = @user[:id]
       redirect '/'
     else
       erb :'/users/invalid'
     end

  end

  get '/logout' do
    session[:id] = nil
    redirect "/"
  end

  get '/:id' do
    @user = User.find params[:id]
    @albums =@user.albums


    erb :"/users/particular_user"
  end

end