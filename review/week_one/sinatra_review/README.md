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
