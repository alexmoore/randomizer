require 'net/http'

class RandomDotOrg
	RANDOMIZER_ORG_INTEGERS_URL = 'http://www.random.org/integers/'
	RANDOMIZER_ORG_SEQUENCE_URL = 'http://www.random.org/sequences/'
	
	attr_accessor :number_of_results, :range_min, :range_max, :unique
	
	def initialize
		@number_of_results = 10
		@range_min = 1
		@range_max = 100
		@unique = true
	end
	
	def get_numbers
		if @unique
			mode = RANDOMIZER_ORG_SEQUENCE_URL
		else
			mode = RANDOMIZER_ORG_INTEGERS_URL
		end
		
		url = "#{mode}?num=#{URI.encode(@number_of_results.to_s)}&min=#{URI.encode(@range_min.to_s)}&max=#{URI.encode(@range_max.to_s)}&col=1&base=10&format=plain&rnd=new"

		begin
			results = Net::HTTP.get_response(URI.parse(url))
		rescue Exception => e
			puts 'Connection error: ' + e.message
		end
		results.body
	end
end