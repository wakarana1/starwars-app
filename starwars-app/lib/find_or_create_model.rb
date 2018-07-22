class FindOrCreateModel
  require 'net/http'

  def initialize
  end

  def find_entry(url)
      url_arr = url.split('/')
      class_type = url_arr[-2].capitalize
      id = url_arr[-1]
      @entry = class_type.find(id)
      if @entry
        json_response(@entry)
      else
        create_entry(url)
      end
  end

  def create_entry(url)
    request = Net::HTTP::Get.new(URI.parse(url).to_s)
    result = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
    p result
    json_response(result)
  end
end
