class StarWarsAPI

  def find_or_fetch(url)
    @url_arr = url.split('/')
    @class_type = @url_arr[-2].singularize.capitalize.constantize
    @id = @url_arr[-1].to_i
    @entry = find_entry(@class_type, @id)
    if @entry.nil?
      @entry = create_entry(url, @class_type, @id)
    end
    @entry
  end

  private

  def create_entry(url, class_type, id)
    new_entry = class_type.new(fetch(url))
    new_entry.id = id
    new_entry.save!
    new_entry
  end

  def fetch(url)
    uri           = URI.parse(url)
    http          = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl  = true
    request       = Net::HTTP::Get.new(uri.request_uri)
    response      = http.request(request)
    if response.code == "301"
      response = Net::HTTP.get_response(URI.parse(response.header['location']))
    end
    JSON.parse(response.body)
  end

  def find_entry(class_type, id)
    class_type.find_by(id: id)
  end


end
