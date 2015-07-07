TWITTER = Twitter::REST::Client.new do |config|
  config.consumer_key        = LB_TWITTER_CONSUMER_KEY
  config.consumer_secret     = LB_TWITTER_CONSUMER_SECRET
  config.access_token        = LB_TWITTER_ACCESS_TOKEN
  config.access_token_secret = LB_TWITTER_ACCESS_SECRET
end





