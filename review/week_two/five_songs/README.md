# Five Songs
Five Songs is a Rails app that displays songs on the index page. Users do not have to be registered to add songs. Songs have titles and video links; the last five of which are displayed in a table on the home page.  
  
## Getting Started.
```
rails new five_songs -T -d postgresql
cd five_songs
mv README.rdoc README.md
bundle exec rake db:create
```

## The Controller
Let's start our app with the controller. Why? Why not?  

First, we'll give ourselves an index action, so we have something to display on our home page. However, we will actually have to add a route to display it. Maybe even a root route!  
  
Let's manually create our controller.
```shell
touch app/controllers/songs_controller.rb
atom app/controllers/songs_controller.rb
```
Now that that is open in your favorite editor, let's edit it up.
```ruby
# app/controllers/songs_controller.rb
class SongsController < ApplicationController

  def index
    render text: "Hello"
  end

end
```

## Routes
In order to actually access anything on our site, we need to specify routes. Rails gives us a cool method for specifying the root route. Yep! It's `root` Let's try it out.
```ruby
# config/routes.rb
class Rails.application.routes.draw do
  root 'songs#index'
end
```

