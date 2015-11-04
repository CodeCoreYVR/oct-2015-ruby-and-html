# One to Many
Let's add a one to many relation; albums have many songs, and song belongs to album.  
  
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
