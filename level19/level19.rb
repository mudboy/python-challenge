require 'base64'

data = ""
open('data.txt') do |file|
	data = Base64.decode64 file.read
	open('indian.wav', 'wb') do |wav|
		wav.write data
	end
end

header = data[0,44]
samples = data[44,data.length]

pos = 0
while pos < samples.length
	samples[pos+1], samples[pos] = samples[pos], samples[pos+1]
	pos += 2
end

open('indian2.wav', 'wb') do |wav2|
	wav2.write header
	wav2.write samples
end
