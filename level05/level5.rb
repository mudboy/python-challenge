#next url is: http://www.pythonchallenge.com/pc/def/channel.html
require 'Unpickle'

#puts Unpickler.new.load(open('banner.p')).map{|row|row.inject(""){|r,(k,v)|r+=k*v}}

#unpickle the banner
data = Unpickler.new.load(open('banner.p'))

# the data is an array of arrays with each sub array an array of pairs
# the pairs are made of an array with a single character string and an integer
#      |-----------array--------------------|
#      | |----subarray-------|  |---------| |
#      | ||---thepairs------||  |         | |
# e.x. [ [["#", 10],[" ", 10]], [["#", 10]] ]

# for each sub array map the following function
banner = data.map do |subarray|
	# use inject to iterate over the pairs
	subarray.inject("") do |the_row, (char, amount)|
		# the param (char, amount) uses the
		# tuple constructor to split the pair into
		# two variables; char and amount
		# e.x. a, b = ["bob", "roberts"] => a = "bob" and b = "roberts"
		the_row += char * amount
	end
end
		
puts banner