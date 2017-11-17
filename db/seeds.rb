# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'
# https://github.com/flori/json
require 'json'
# http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
require 'pp'

# Construct the URL we'll be calling
request_uri = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
request_query = ''
url = "#{request_uri}#{request_query}"

Dose.destroy_all
Ingredient.destroy_all
# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read

# Sample JSON response from fake API endpoint (a simple app running on my machine), but you can easily build it. Credit goes to Michael Hartl for the stellar "Build Twitter in Rails" tutorial:
#
# http://ruby.railstutorial.org/ruby-on-rails-tutorial-book
#
# Output after running it through http://jsonviewer.net to make it more readable.
# ['0'] (
# |    id =  2
# |    name =  "Example User"
# |    email =  "example@railstutorial.org"
# |    created_at =  "2013-12-11T06:09:06.866Z"
# |    updated_at =  "2013-12-11T06:09:06.866Z"
#      # ... and more
# |    )
# ['1'] (
# |    id =  4
# |    name =  "Example User 2"
# |    email =  "example@railstutorial.org"
# |    created_at =  "2013-12-11T06:09:06.866Z"
# |    updated_at =  "2013-12-11T06:09:06.866Z"
#      # ... and more
# |    )

# Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
result = JSON.parse(buffer)
puts result

# Loop through each of the elements in the 'result' Array & print some of their attributes.
result["drinks"].each do |ingredient|
  ingredient.each do |key, value|
    Ingredient.create(name: value)
  end
end
