# space_picture_of_the_day

This displays a beautiful image sourced from NASA of a their chose daily subject. 
You can also find the day's date and the title of the image below it.

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
