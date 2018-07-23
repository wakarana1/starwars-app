class LandingController < ApplicationController
  require './lib/find_or_create_model'
  require 'open-uri'

  def index
    @entry = find_entry(params[:url])
    if @entry.nil?
      puts "IM IN THE ELSE"
      @entry = create_entry(params[:url])
    end
    json_response(@entry)
  end

  def find_entry(url)
    url_arr = url.split('/')
    class_type = url_arr[-2].singularize.capitalize.constantize
    id = url_arr[-1].to_i
    @entry = class_type.find_by(id: id)
  end

  def create_entry(url)
    url_arr       = url.split('/')
    class_type    = url_arr[-2].singularize.capitalize.constantize
    id            = url_arr[-1].to_i
    uri           = URI.parse(url)
    http          = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl  = true
    request       = Net::HTTP::Get.new(uri.request_uri)
    response      = http.request(request)
    if response.code == "301"
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
    end
    pp JSON.parse(response.body)
    new_entry = class_type.new(JSON.parse(response.body))
    new_entry.id = id
    new_entry.save!
    return new_entry
  end

end
