get '/' do
  @photos = Photo.all
  erb :index
end

get '/users/:user_id/albums' do
  @user = User.find(params[:user_id])
  @albums = Album.where("user_id = ?", @user.id)
  erb :user
end

get '/albums/:album_id/:photo_id' do
  @photo = Photo.find(params[:photo_id])
  @user = User.find(Album.find(@photo.album_id).user_id)
  erb :photo
end

get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  @user = User.find(@album.user_id)
  erb :album
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

post '/login' do
  if User.authenticated?(params[:user][:username], params[:user][:password])
    session[:id] = User.find_by_username(params[:user][:username]).id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/createuser' do 
  user = User.create_user(params[:user])
  session[:id] = user.id
  redirect '/'
end
