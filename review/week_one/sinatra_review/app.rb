require 'sinatra'

enable :sessions

get '/' do
  @songs = session[:songs] ? session[:songs] : {}
  erb :index, layout: :default
end

get '/new_song' do
  erb :song_form, layout: :default
end

post '/new_song' do
  session[:songs] = {} unless session[:songs]
  session[:songs][params[:title]] = params[:video_link]
  redirect to('/')
end

get '/session' do
  session.inspect
end
