require 'sinatra'

get '/' do
  erb :index, layout: :default
end

get '/new_song' do
  erb :song_form, layout: :default
end

post '/new_song' do
  "You entered the song #{params[:title]}, and the link #{params[:video_link]}"
end
