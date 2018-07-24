class StarWarsAPI
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
end
