# One to Many
Let's add a one to many relation; albums have many songs, and song belongs to album.  
  
## Model
We'll start by creating an album model.
```shell
bin/rails generate model album title:string
```
We also want to generate a migration to add an `album_id` column to our songs table.
```shell
bin/rails generate migration add_album_references_to_songs album:references
```
We'll also want to open up the models, and add `belongs_to` and `has_many`
```ruby
# app/models/song.rb

class Song < ActiveRecord::Base
  belongs_to :album
  scope :recent_five, -> { order("created_at ASC").limit(5) }
end
```
```ruby
# app/models/album.rb

class Album < ActiveRecord::Base
  has_many :songs, dependent: :destroy
end
```
Don't forget to `bin/rake db:migrate`
This gives us some pretty cool methods to use, such as `@song.album`, and `@album.songs`. Since albums have many songs, we can treat this collection of songs similarly to how we would treat an array, and we can push (`<<`) new songs into it: `@album.songs << @song`.
  
Let's create some albums and songs thourgh `bin/rails console`
```shell
# new
album = Album.new
album.title = "Milk Famous"
album.save

# vs create
Album.create(title: "Milk Famous")
album = Album.last

# new
song = album.songs.new
song.title = "I'm not me"
song.save

# vs create
album.songs.create(title: "I'm not me", video_link: "https://www.youtube.com/watch?v=OQ7Bc-nrplw")
```
## Views
We want to change the navigation to have an albums link that brings us to the albums index view.
```erb
<% # app/views/layouts/application.html.erb %>

<!DOCTYPE html>
<html>
<head>
  <title>FiveSongs</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>

  <nav>
    <%= link_to "home", root_path %> | 
    <%= link_to "albums", albums_path %>
  </nav>
  <%= yield %>

</body>
</html>
```
This gives us an excellent error message, showing us we do not have a local variable or method called `albums_path`. Let's change this by adding a route.  
  
With routes and a controller, we also need album views.
```erb
<% # app/views/albums/index.html.erb %>

<h1>All Albums</h1>

<table>
  <tr>
    <th>album title</th>
    <th>add song</th>
  </tr>
  <% @albums.each do |album| %>
    <tr>
      <td><%= link_to album.title, album_path(album) %></td>
      <td><%= link_to "add song", "" %></td>
    </tr>
  <% end %>
</table>
```
```erb
<% # app/views/albums/show.html.erb %>

<h1><%= @album.title %></h1>

<table>
  <tr>
    <th>song title</th>
    <th>video link</th>
  </tr>
  <% @album.songs.each do |song| %>
    <tr>
      <td><%= song.title %></td>
      <td><%= link_to "watch video", song.video_link %></td>
    </tr>
  <% end %>
</table>
```
*note* because we have nested songs under albums, we need to change the edit and delete paths on the songs index view.
```erb
<% # app/views/songs/index.html.erb %>

<% # ... %>

    <tr>
      <td><%= song.title %></td>
      <td><%= link_to "watch video", song.video_link %></td>
      <td><%= link_to "edit song", edit_album_song_path(song.album, song), class: "btn btn-default" %></td>
      <td><%= link_to "delete song", album_song_path(song.album, song), {method: :delete, class: "btn btn-default"} %></td>
    </tr>

<% # ... %>
```
And now to edit our songs, we need to use the album songs path. Let's start by changing the form, and specifying the url to the correct path.
```erb
<%= form_for [@album, @song], url: album_song_path do |f| %>
  <div class="form-group">
    <%= f.label :title %>
    <%= f.text_field :title, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.label :video_link %>
    <%= f.text_field :video_link, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.submit class: "btn btn-default" %>
  </div>
<% end %>
```
And finally, let's add a working path to add new songs!
```erb
<% # app/views/albums/index.html.erb %>

<h1>All Albums</h1>

<table>
  <tr>
    <th>album title</th>
    <th>add song</th>
  </tr>
  <% @album.each do |album| %>
    <tr>
      <td><%= link_to album.title, album_path(album) %></td>
      <td><%= link_to "add song", "" %></td>
    </tr>
  <% end %>
</table>
```
## Controllers
Let's make sure to add an albums controller
```ruby
class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end
end
```
## Routes
Let's add routes for albums.
```ruby
# config/routes.rb
Rails.application.routes.draw do
  root "songs#index"
  resources :albums, only: [:index, :show] do
    resources :songs
  end
end
```

