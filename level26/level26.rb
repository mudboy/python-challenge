require 'digest/md5'

def search
	open('mybroken.zip', 'rb') do |file|
		data = file.read
		data.length.times do |i|
			print "trying byte #{i}\r"
			old = data[i]
			(0..255).each do |b|
				data[i] = b
				digest = Digest::MD5.hexdigest(data)
				if digest == 'bbb8b499a0eef99b52c7f13f4e78c24b'
					puts "\ndone"
					puts "byte #{i} was #{old} and should of been #{b}"
					open('myfixed.zip', 'wb') {|out| out.write data}				
					return
				end
			end
			data[i] = old
		end
	end
end

search

# the answer is: speed
# #http://www.pythonchallenge.com/pc/hex/speedboat.html butter:fly
