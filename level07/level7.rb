# http://www.pythonchallenge.com/pc/def/oxygen.html
require 'RMagick'

img = Magick::Image.read('oxygen.png').first

pixels = img.get_pixels(0, 45, 607, 1)

values = []
pixels.each_with_index {|p, i| values << p.red if i % 7 == 0}

message = values.map {|v| v.chr}.join

puts message

answer = message.scan(/\[(.*)\]/).first.first.split.map{|n| n.to_i.chr}.join

puts answer

# the answer is integrity