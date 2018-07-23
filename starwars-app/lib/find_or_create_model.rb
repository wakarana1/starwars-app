class FindOrCreateModel
  require 'net/http'
  require 'active_support/inflector/methods.rb'

  def initialize
  end

  def find_entry(url)
      url_arr = url.split('/')
      class_type = url_arr[-2].singularize.capitalize.constantize
      id = url_arr[-1].to_i
      @entry = class_type.find(id)
      if @entry
        json_response(@entry)
      else
        create_entry(url)
      end
  end

  def create_entry(url)
    uri = URI.parse(url).to_s
    request = Net::HTTP::Get.new(uri)
    p uri, request
    result = Net::HTTP.start(uri.host, uri.port) { |http| http.request(request) }
    p result
    json_response(result)
  end
end
