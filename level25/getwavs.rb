require 'open-uri'
num = 1
25.times do
	open("http://www.pythonchallenge.com/pc/hex/lake#{num}.wav", :http_basic_authentication=>['butter', 'fly']) do |file|
		open("lake#{num}.wav", 'wb') do |wav|
			wav.write file.read
		end
	end
	num += 1
end
