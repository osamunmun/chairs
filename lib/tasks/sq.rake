# encoding: utf-8
namespace :sq do
  desc "forsquareからVenueを取得する"
  task :venue do
  require 'net/https'
  Net::HTTP.version_1_2
  FOURSQUARE_CLIENT_ID = "#{ENV['FOURSQUARE_CLIENT_ID']}"
  FOURSQUARE_CLIENT_SECRET = "#{ENV['FOURSQUARE_CLIENT_SECRET']}"
  http = Net::HTTP.new('api.foursquare.com', 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.get("/v2/venues/search?ll=35.60,139.73&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_CLIENT_SECRET}&v=20130119&query=starbucks")
  puts response.body
  end
end
