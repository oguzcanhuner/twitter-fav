require 'twitter'
require 'pry'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

client.search(ENV['QUERY'], lang: "en").take(5).each do |tweet|
  if !client.friendship?(client.user, tweet.user)
    client.fav!(tweet)
    puts "favourited: #{tweet.text}"
  else
    puts "skipped: #{tweet.text}"
  end
  sleep(8)
end
