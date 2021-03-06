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

  resources :songs, only: [:new, :create]
end
```
## Controllers
As was quite evident by the error message we received, we have no songs controller. Let's go ahead and add that controller, and an index action within it.  
  
The index action should return a collection of the most recently added five songs.
```ruby
# app/controllers/songs_controller.rb

class SongsController < ApplicationController

  def index
    @songs = Song.recent_five # we will have to create this method in the model
  end

  def new
    @new = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit([:title, :video_link]))
    if @song.save
      redirect_to root_path
    else
      render :new
    end
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
      <td><%= link_to "watch", song.video_link %></td>
    </tr>
  <% end %>
</table>

```
  
```erb
<% # app/views/songs/new.html.erb %>

<h1>New Song</h1>

<%= form_for @song do |f| %>
  <div class="form-group">
    <%= f.label :title %>
    <%= f.text_field :title, class: "form-control" %>
  </div>
  <div>
    <%= f.label :video_link %>
    <%= f.text_field :video_link, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.submit class: "btn btn-default" %>
  </div>
<% end %>
```
### Navigation
We want to add `home` and `add song` (new song) links to a navigation menu. We could do this individually for each view. However, since we want the same things to display on all our views, it might make more sense to just add it to the application layout.

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
    <%= link_to "add song", new_song_path %>
  </nav>

  <%= yield %>

</body>
</html>
```

## Models
Let's add a Song model. We want it to have titles and video links, and that's about it.  
  
When we use `rails generate` to generate our models, it adds a very nice migration file for us. Let's give it a try.

```shell
bin/rails generate model song title:string video_link:text
```
The migration file contains the information for what fields to add to the songs table in the database.
```ruby
# db/migrate/20151031204659_create_songs.rb

class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :video_link

      t.timestamps null: false
    end
  end
end
```
And of course, it also generated the model, where we can _finally_ add that `recent_five` method.
```ruby
# app/models/song.rb

class Song < ActiveRecord::Base

  def self.recent_five
    order("created_at DESC").limit(5)
  end

end
```
Let's run `bin/rake db:migrate` to create the table in the database,
then we'll hop into `bin/rails console` and make some song records.

## Rails Console
Let's add some songs through `bin/rails console`. Note: We've added the [hirb gem](https://github.com/cldwalker/hirb) so our tables will look nice and pretty, if we `Hirb.enable`.
```shell
bin/rails console
Hirb.enable

# Instantiate a song
# then add attributes
song = Song.new
song.title = "I wanna go"
song.video_link = "https://www.youtube.com/watch?v=F94hVx3cw88"
song.save

# Create a song
# directly to the db
Song.create(title: "I wanna go", video_link: "https://www.youtube.com/watch?v=F94hVx3cw88")
```
