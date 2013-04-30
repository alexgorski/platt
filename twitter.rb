require 'twitter'
require 'pry'

Twitter.configure do |config|
  config.consumer_key = ENV["TWITTER_KEY"]
  config.consumer_secret = ENV["TWITTER_SECRET"]
  config.oauth_token = ENV["TWITTER_OATH_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_OATH_TOKEN_SECRET"]
end


@tweets = Twitter.search('Momofuku Ko')
@tweet = @tweets.to_hash
@tweet.each do |t|
	@total = []
	@text = []
	@total << t[1][0][:id]
	@text << t[1][0][:text]
end
	
end