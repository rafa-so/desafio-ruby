require "rubygems"
require "net/https"
require "uri"
require "json"


#uri = URI.parse('http://www.timex.com.br/api/catalog_system/pub/products/search/')
uri = URI.parse('https://www.schumann.com.br/api/catalog_system/pub/products/search/')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0'
request.initialize_http_header({"User-Agent" => user_agent})

res = http.request(request)
response = JSON.parse(res.body)
puts response
