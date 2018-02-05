require 'net/https'
require 'json'
require 'yaml'

config = YAML.load_file('config.yml')
puts config

puts config["format"]
url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?"
url_format="format=" + config["format"]
url_application_id = "applicationId=" + config["appId"].to_s
puts (url + url_format + '&' + url_application_id)
uri = URI.parse(url + url_format + '&' + url_application_id)
http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = true

res = Net::HTTP.get(uri)
puts JSON.load(res)
