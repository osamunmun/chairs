# encoding: utf-8
require 'net/https'
require 'json'
require 'rake'
require 'pry'

FOURSQUARE_CLIENT_ID = "#{ENV['FOURSQUARE_CLIENT_ID']}"
FOURSQUARE_CLIENT_SECRET = "#{ENV['FOURSQUARE_CLIENT_SECRET']}"
OAUTHTOKEN = "#{ENV['OAUTHTOKEN']}"
TIMENOW = Time.now

namespace :sq do
  desc "forsquareからVenueを取得する"
  task :venue => :environment do
    Net::HTTP.version_1_2
    @http = create_http_client
    begin
      cafes = get_cafes()
    rescue 
      puts "Failed to get cafes!"
    end
    cafes['response']['venues'].to_a.each {|cafe|
      if cafe['name'].include?("大井町") || cafe['name'].include?("品川")
        chair_record = Cafe.find_by_venue_id(cafe['id'])
        location = cafe['location']
        image = cafe['categories'][0]['icon']
        if chair_record 
          chair_record.update_attributes(:name => cafe['name'], :location => "#{location['state']} #{location['city']} #{location['address']}", :image => "#{image['prefix']}#{image['suffix']}")
        else
          chair_record = Cafe.new(:venue_id => cafe['id'], :name => cafe['name'], :id => cafe['id'], :location => "#{location['state']} #{location['city']} #{location['address']}", :image => "#{image['prefix']}#{image['suffix']}")
        end
        puts "Failed to update DB record" if !chair_record.save
      end
    }
  end

  desc "forsquareからhereNowを取得する"
  task :herenow => [:venue, :environment] do
    Cafe.all.each {|cafe|
      begin
        herenow = get_herenow(cafe['venue_id'])
        Herenow.create(:herenow => herenow, :venue_id => cafe['venue_id'])
      rescue 
        puts "Failed to get herenow!"
      end
    }
  end
  
  desc "満席かどうかを判定する"
  task :chair => [:herenow, :environment] do
    venue_ids = Cafe.find(:all, :select => "venue_id")
  end
end 

def create_http_client
  http = Net::HTTP.new('api.foursquare.com', 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  http
end 

def get_cafes()
  today = TIMENOW.strftime("%Y%m%d")
  raise if !response = @http.get("/v2/venues/search?ll=35.60,139.73&client_id=#{FOURSQUARE_CLIENT_ID}&client_secret=#{FOURSQUARE_CLIENT_SECRET}&v=#{today}&query=starbucks")
  json = JSON.parser.new(response.body)
  hash = json.parse()
end

def get_herenow(id)
  time_hour_ago = (TIMENOW - 3600).to_i
  raise if !response = @http.get("/v2/venues/#{id}/herenow?oauth_token=#{OAUTHTOKEN}&afterTimestamp=#{time_hour_ago}")
  json = JSON.parser.new(response.body)
  hash = json.parse()
  hash['response']['hereNow']['count']
end
