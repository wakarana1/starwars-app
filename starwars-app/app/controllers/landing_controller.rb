class LandingController < ApplicationController

  def index
    @url_arr = params[:url].split('/')
    @class_type = @url_arr[-2].singularize.capitalize.constantize
    @id = @url_arr[-1].to_i
    @entry = find_entry(@class_type, @id)
    if @entry.nil?
      @entry = create_entry(params[:url], @class_type, @id)
    end
    json_response(@entry)
  end

  def find_entry(class_type, id)
    class_type.find_by(id: id)
  end

  def create_entry(url, class_type, id)
    uri           = URI.parse(url)
    http          = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl  = true
    request       = Net::HTTP::Get.new(uri.request_uri)
    response      = http.request(request)
    if response.code == "301"
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
    end
    new_entry = class_type.new(JSON.parse(response.body))
    new_entry.id = id
    new_entry.save!
    return new_entry
  end

end
