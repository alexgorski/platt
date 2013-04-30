require 'twitter'
require 'pry'

Twitter.configure do |config|
  config.consumer_key = '3ulQawSASFuqM2JZsGioKA'
  config.consumer_secret = '4Lc3kf3XqNLUcq5R4ZiuVEOQ6xlr5dh6dKfNBrBRlo'
  config.oauth_token = '21169833-46EIWBHKh93RZ5qOGn0u3YPto9ajXJjt9rEQUebFk'
  config.oauth_token_secret = 'zIkVKHa9GsAyIIqt2IVNnGIRXfbHaQEBYYvGHyq2tg'
end

@restaurants = Restaurant.all
@restaurants.each do |r|
		r.tweets_num = 0
		@tweets = Twitter.search('r.name', :geocode => '40.768483,-73.981248,20mi', :count => '100', :since_id => r.tweets_last_id)
		# id = @tweets.since_id(@tweets[1][0][:id]).fetch
		@tweet = @tweets.to_hash
		@tweet.each do |t|
			r.tweets_num =+ 1
			r.tweets_last_id = t[1][0][:id]
			binding.pry
		end
	end
	
