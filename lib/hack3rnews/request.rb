require 'rest-client'
require 'json'

class Request
  def item(url)
    response = RestClient.get(url)
    JSON.parse(response)
  end
end
