get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users/:user_id/albums' do

end

get '/albums/:album_id/:photo_id' do

end

get '/albums/:album_id' do

end

