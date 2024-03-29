require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  api_key = ENV['NASA_API']
  api_url = "https://api.nasa.gov/planetary/apod?api_key=#{api_key}"

  # use HTTP.get to retrieve the API information
  raw_data = HTTP.get(api_url)

  # convert the raw request to a string
  raw_data_string = raw_data.to_s

  # convert the string to JSON
  parsed_data = JSON.parse(raw_data_string)

  # get the photo
  @image_url = parsed_data["hdurl"]
  @date_data = parsed_data["date"]
  @title_data = parsed_data["title"]

  quote_api_url = "https://stoic-quotes.com/api/quote"

  # use HTTP.get to retrieve the API information
  quote_raw_data = HTTP.get(quote_api_url)

  # convert the raw request to a string
  quote_raw_data_string = quote_raw_data.to_s

  # convert the string to JSON
  quote_parsed_data = JSON.parse(quote_raw_data_string)

  #get the quote
  @quote_text = quote_parsed_data["text"]
  @quote_author = quote_parsed_data["author"]
 erb(:homepage)
end
