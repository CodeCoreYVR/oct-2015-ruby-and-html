require "sinatra"
require "sinatra/reloader"
require "faker"

enable :sessions

# HTTP > WEBRICK > SINATRA

# when the Sinatra applictaion receives a GET request with a url "/"
# (usually used for home page)
# we send back a text response that says "Hello World"
# The VERY / URL pair must be unique
# get "/" do
#   "<h1>Hello World</h1>"
# end

get "/" do
  # by calling the erb method with an argument. Sinatra will look in the views
  # folder located within the same folder as this file (app.rb) and it will
  # render a file named: index.erb (this is called a convention)
  # erb method will render the index.erb template and generate HTML code from it
  # the HTML code will then be sent as a response to the client.
  # erb :index, layout: :app_layout
  erb(:index, {layout: :app_layout})
end

get "/hello" do
  # erb(:hello, {locals: {name: "Tam"}})
  @name = "Tam"
  # Sinatra sends whatever the block returns as a response (last line)
  erb :hello, {layout: :app_layout}
end

get "/hi" do
  "Hi There! #{params}"
end

get "/catch_phrase" do
  @catch_phrase = Faker::Company.catch_phrase
  erb :catch_phrase, {layout: :app_layout}
end

get "/contact" do
  erb(:contact, {layout: :app_layout})
end

post "/contact_submit" do
  @params = params
  erb :thank_you, {layout: :app_layout}
end

get "/convertor" do
  erb :convertor, {layout: :app_layout}
end

post "/convertor" do
  # params: {"temp" => "25"}
  @temp_c = params["temp"].to_f
  @temp_f = ((@temp_c * 9)/5) + 32
  session[:last_temp] = @temp_c
  erb :convertor, {layout: :app_layout}
end

get "/change_color" do
  session[:last_color] = params["color"]
  redirect back
end
