require 'net/http'
require 'json'
class VisitorsController < ApplicationController
  before_action :authenticate_user!
  def index
    uri = URI('http://www.asterank.com/api/asterank?query={%22e%22:{%22$lt%22:0.1},%22i%22:{%22$lt%22:10},%22a%22:{%22$lt%22:7.5},%22profit%22:{%22$gt%22:0}}&limit=100')
    # Net::HTTP.start(uri.host, uri.port) do |http|
    #   request = Net::HTTP::Get.new uri
    #   response = http.request request # Net::HTTPResponse object
    #   p response
    # end
    res = Net::HTTP.get_response(uri)
    @asteroids = JSON.parse(res.body)
    # p @asteroids
  end
end
