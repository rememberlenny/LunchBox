SendWithUs::Api.configure do |config|
    config.api_key = ENV['LB_SENDWITHUS']
    config.debug = true
end
