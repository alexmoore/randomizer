require 'net/http'

RANDOMIZER_ORG_INTEGERS_URL = 'http://www.random.org/integers/'
RANDOMIZER_ORG_SEQUENCE_URL = 'http://www.random.org/sequences/'
number_of_results = 10
range_min = 1
range_max = 100
unique = true
url = "#{RANDOMIZER_ORG_SEARCH_URL}?num=#{URI.encode(number_of_results.to_s)}&min=#{URI.encode(range_min.to_s)}&max=#{URI.encode(range_max.to_s)}&col=1&base=10&format=plain&rnd=new"

begin
	results = Net::HTTP.get_response(URI.parse(url))
rescue Exception => e
	puts 'Connection error: ' + e.message
end

return results.body