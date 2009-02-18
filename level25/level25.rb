require 'open-uri'
require 'Rmagick'
include Magick

data = []
img = Image.new(60*5, 60*5)

25.times do |i|
	open("http://www.pythonchallenge.com/pc/hex/lake#{i+1}.wav", :http_basic_authentication=>['butter', 'fly']) do |file|
		guts = file.read
		data = guts[44, guts.length]
	end
	
	png = Image.from_blob(data) do |it|
		it.depth = 8
		it.size = '60x60'
		it.format = 'RGB'
	end
	
	#png[0].write("lake#{i+1}.png")
	
	row, column =  i % 5, (i / 5) % 5
	img.composite!(png[0], row*60, column*60, SrcInCompositeOp)
end

img.write('lake.png')

#the answer is: decent
#http://www.pythonchallenge.com/pc/hex/decent.html

		