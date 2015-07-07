TWITTER = Twitter::REST::Client.new do |config|
  bearer_token = ''
  if !current_user.nil?
    bearer_token = current_user.twitter_access_token
  end
  config.consumer_key        = ENV['LB_TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['LB_TWITTER_CONSUMER_SECRET']
  config.bearer_token        = bearer_token
end





