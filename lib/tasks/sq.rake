# encoding: utf-8
namespace :sq do
  desc "forsquareからVenueを取得する"
  task :venue do
  require 'net/https'
  Net::HTTP.version_1_2
  http = Net::HTTP.new('api.foursquare.com', 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  response = http.get('/v2/venues/search?ll=35.60,139.73&client_id=FZ1OZAF0XZFNGHLT34IBPJKQ3H1EFPOW3YCQFMRBS2MSPOET&client_secret=KLXEK2EGDVC4H3HC4OUNNNXF0SFTXACZJFTVQB3VDLW3SWQJ&v=20130119&query=starbucks')
  puts response.body
  end
end
