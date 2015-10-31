# Five Songs
A rails app to display the five most recently added songs on the index page. Also, to review Rails CRUD.
  
## Getting Started
```shell
rails new five_songs -T --database postgresql
cd five_songs && mv README.rdoc README.md
bin/rake db:create db:migrate
bin/rails server
```
## Routes
Let's begin by adding a root route. Since our app is going to display 5 songs on an index page, we already have the idea that we will need a song model, a songs controller, a form to add new songs, and of course an index view to display a list of songs.  
  
Our root route should point to the songs index.  
  
```ruby
# config/routes.rb
Rails.application.routes.draw do
  root "songs#index"
end
```
## Controllers
As was quite evident by the error message we received, we have no songs controller. Let's go ahead and add that controller, and an index action within it.  
  
```ruby
# app/controllers/songs_controller.rb

class SongsController < ApplicationController

  def index
  end

end
```

## Views
Our view files should be located in a directory called songs that exists within our app/views/ directory. Let's make that now: `mkdir app/views/songs`, and add an index view.  
```erb
<% # app/views/songs/index.html.erb %>
<h1>Five Songs</h1>

  <table>
    <tr>
      <th>title</th>
      <th>video link</th>
    </tr>
    <% @songs.each do |song| %>
      <tr>
        <td><%= song.title %></td>
        <td><%= song.video_link %></td>
      </tr>
    <% end %>
  </table>

```
