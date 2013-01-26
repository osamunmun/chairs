# encoding: utf-8
require 'net/https'
require 'json'

FOURSQUARE_CLIENT_ID = "#{ENV['FOURSQUARE_CLIENT_ID']}"
FOURSQUARE_CLIENT_SECRET = "#{ENV['FOURSQUARE_CLIENT_SECRET']}"
OAUTHTOKEN = "#{ENV['OAUTHTOKEN']}"

namespace :sq do
  desc "forsquareからVenueを取得する"
  task :venue do
    Net::HTTP.version_1_2
    @http = create_http_client
    get_venues()['response']['venues'].to_a.each {|venue|
      id = venue['id']
      name = venue['name']
      if name.include?("大井町") || name.include?("品川")
        herenow_count = get_herenow(id)
        puts "#{name}  #{herenow_count}"
      end
    }
  end
end 

def create_http_client
  http = Net::HTTP.new('api.foursquare.com', 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end 

def get_venues()
  response = @http.get("/v2/venues/search?ll=35.60,139.73&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_CLIENT_SECRET}&v=20130119&query=starbucks")
  json = JSON.parser.new(response.body)
  hash = json.parse()
end

def get_herenow(id)
  response = @http.get("/v2/venues/#{id}/herenow?oauth_token=#{OAUTHTOKEN}")
  json = JSON.parser.new(response.body)
  hash = json.parse()
  hash['response']['hereNow']['count']
end
