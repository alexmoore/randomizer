require "getoptlong"

opts = GetoptLong.new(
		["--help", "-h", GetoptLong::NO_ARGUMENT],
		["--min", GetoptLong::REQUIRED_ARGUMENT],
		["--max", GetoptLong::REQUIRED_ARGUMENT],
		["--num", "-n", GetoptLong::REQUIRED_ARGUMENT],
		["--unique", "-u", GetoptLong::REQUIRED_ARGUMENT]
)

minimum = 1
maximum = 100
number_of_results = 10
unique_results = true

opts.each do |opt, arg|
	case opt
		when '--help'
			RDoc::usage
		when '--min'
			minimum = arg.to_i
		when '--max'
			maximum = arg.to_i
		when '--num'
			number_of_results = arg.to_i
		when '--unique'
			if( arg == "f" || arg == "false" || arg == "0")
				unique_results = false
			elsif( arg == "t" || arg == "true" || arg == "1")
				unique_results = true
			end
	end
end

print "MIN:" + minimum.to_s + "\n"
print "MAX:" + maximum.to_s + "\n"
print "NUMBER OF RESULTS:" + number_of_results.to_s + "\n"
print "UNIQUE RESULTS:" + unique_results.to_s + "\n"
