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
      <td><%= link_to "edit song", edit_song_path(song), class: "btn
btn-default" %></td>
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
