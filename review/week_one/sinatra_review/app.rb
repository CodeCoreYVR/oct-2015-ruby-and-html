require 'sinatra'

get '/' do
  erb :index
end

get '/new_song' do
  "display a form"
end
