# Bootstrap
[Bootstrap](https://github.com/twbs/bootstrap-sass) is a CSS framework that gives us a bunch of styles for classes that we can just use. Start by adding the `boostrap-sass` gem to your gemfile
```ruby
# Gemfile

# ...

# Gems added by me with <3
gem 'bootstrap-sass', '~> 3.3.5'
```
Let's add a new file in our `app/assets/stylesheets` directory, specifically for importing bootstrap, and adding our own custom CSS.
```scss
// app/assets/stylesheets/bootstrap_and_custom_css.css.scss

@import "bootstrap-sprockets";
@import "bootstrap";
```
Then, `bin/bundle install`.
