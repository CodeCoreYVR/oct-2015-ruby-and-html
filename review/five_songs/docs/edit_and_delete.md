# Adding Edit and Delete

## Views
Let's add edit and delete buttons to our index view.

```erb
<% # app/views/songs/index.html.erb %>

<h1>Five Songs</h1>

<table>
  <tr>
    <th>title</th>
    <th>video link</th>
    <th>edit song</th>
    <th>delete song</th>
  </tr>
  <% @songs.each do |song| %>
    <tr>
      <td><%= song.title %></td>
      <td><%= link_to "watch video", song.video_link %></td>
      <td><%= link_to "edit song", edit_song_path(song), class: "btn btn-default" %></td>
      <td><%= link_to "delete song", song_path(song), {method: :delete, class: "btn btn-default"} %></td>
    </tr>
  <% end %>
</table>
```
We'll need to display a form for the edit view. Now is a good time to consider whether it is better for us to copy and paste the form from `new.html.erb` or if it would make more sense to use a form partial.

Let's make an `edit.html.erb` view to display this form.
```erb

<% # app/views/songs/edit.html.erb %>

<%= render "songs_form" %>
```
If we opt to render the form as a partial, then we can do the same thing for the `new.html.erb` view
```erb
<% # app/views/songs/new.html.erb %>

<%= render "songs_form" %>
```
And of course, we need to have the form partial to be displayed.
```erb
<% # app/views/songs/_songs_form.html.erb %>

<%= form_for @song do |f| %>
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

## Routes
Now that we have our form partial sorted out, and have added an edit view, let's add routes to match edit (and update) and destroy. *note*: You can check your routes at [localhost:3000/rails/info/routes](http://localhost:3000/rails/info/routes) if your rails server is running on port 3000.
```erb
# config/routes.rb

Rails.application.routes.draw do
  root "songs#index"

  resources :songs, only: [:new, :create, :edit, :update, :destroy]
end
```
## Controllers
Since we have added buttons and routes to edit and destroy, we will also have to add controller actions to do the same. Notice how the edit and update actions are analogous to the new and create actions.  
  
```ruby
# app/controllers/songs_controller.rb

class SongsController < ApplicationController

  def index
    @songs = Song.recent_five
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit([:title, :video_link]))
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params.require(:song).permit([:title, :video_link]))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
  end

end
```
