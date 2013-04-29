require 'twitter'
require 'pry'

Twitter.configure do |config|
  config.consumer_key = '3ulQawSASFuqM2JZsGioKA'
  config.consumer_secret = '4Lc3kf3XqNLUcq5R4ZiuVEOQ6xlr5dh6dKfNBrBRlo'
  config.oauth_token = '21169833-46EIWBHKh93RZ5qOGn0u3YPto9ajXJjt9rEQUebFk'
  config.oauth_token_secret = 'zIkVKHa9GsAyIIqt2IVNnGIRXfbHaQEBYYvGHyq2tg'
end


@tweets = Twitter.search('Momofuku Ko')
binding.pry
puts @tweets