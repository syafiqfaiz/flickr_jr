enable :sessions


def login?
  if session[:id].nil?
    return false
  else
    return true
  end
end

def id
  return session[:id]
end




get '/' do
  @photos = Photo.last(9)
  # @albums = Album.last(6)
  erb :index
end




