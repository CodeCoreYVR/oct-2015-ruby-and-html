# Cohort X Week 1: Sinatra Review
Let's build out an app that has an index of my favorite songs. We should be able to add songs with a title and a video link and view the songs. We'll use sessions to store the songs.  
  
Add an `app.rb` file, require sinatra, and let's build this out!
```ruby
# app.rb
require 'sinatra'

get '/' do
  "Hello there"
end
```
Let's make sure that things are installed properly on our system, and we're able to at least perform a get request to start.
```
ruby app.rb -p 3000
```
Sinatra, by default, gives us a nice view templating language called [erb](http://ruby-doc.org/stdlib-2.2.3/libdoc/erb/rdoc/ERB.html). Let's modify the get request on our home page to use it.  
  
When we use ERB in Sinatra, it is always expecting a view file (`file_name.erb`) to exist in a directory named `views`.  
```ruby
# app.rb
require 'sinatra'

get '/' do
  erb :index
end
```

```erb
<% # home/index.erb %>
<h1>My Favorite Songs</h1>
```
Now, we want to add in a navigation menu that's the same on every page of our site. Let's do this with a `layout`.
```ruby
# app.rb
require 'sinatra'

get '/' do
  erb :index, layout: :default
end
```
Now that we've specified a layout called `:default`, our program will be expecting this view file to exist inside the `views` directory. Let's make sure that it does.
```erb
<a href="/">home</a> | <a href="/new_song">new song</a>

<%= yield %>
```
Let's add another method for `/new_song` to display a form. This should also use the default layout, but this time, we'll have a form on the view file.
```ruby
# app.rb
require 'sinatra'

get '/' do
  erb :index, layout: :default
end

get '/new_song' do
  erb :song_form, layout: :default
end
```
And add the view with a form on it!
```erb
<% # views/song_form.erb %>
<h1>Add a New Song</h1>

<form method="post">
  title: <input name="title"><br>
  video link: <input name="video_link"><br>
  <input type="submit">
</form>
```
Now that we have a post request happening at `/new_song`, we need our app to handle it. Because we have named our inputs, we have a params hash with the input names as the keys. And of course, the input as the values. Let's use that the method that handles post requests on `/new_song`.
```ruby
require 'sinatra'

get '/' do
  erb :index, layout: :default
end

get '/new_song' do
  erb :song_form, layout: :default
end

post '/new_song' do
  "You entered the song #{params[:title]} and the link: #{params[:video_link]}"
end
```
Now that we have a way to capture song params, let's actually store them somewhere. We'll use sessions for this. With sinatra, to enable sessions, you simply add `enable: :sessions` to your main app file.

```ruby
# app.rb
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
```
And let's add a way to display songs to the index view
```erb
<h1>My Favorite Songs</h1>

<table>
  <tr>
    <th>title</th>
    <th>video link</th>
  </tr>
  <% @songs.each do |title, video_link| %>
    <tr>
      <td><%= title %></td>
      <td><a href="<%= video_link %>">watch video</a></td>
    </tr>
  <% end %>
</table>
```
Play around with that a little, and have a great weekend!
