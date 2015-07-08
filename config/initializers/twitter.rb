Twit = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['LB_TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['LB_TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['LB_TWITTER_ACCESS']
  config.access_token_secret = ENV['LB_TWITTER_ACCESS_SECRET']
end
