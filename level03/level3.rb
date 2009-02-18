# This level also has a hidden text block in the page
# souce. It has the message: 
# One small letter, surrounded by EXACTLY three big bodyguards on each of its sides

File.open('text.txt', 'rb') do |file|
    text = file.read
    p text.scan(/[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]/).join
end

# result: linkedlist
# http://www.pythonchallenge.com/pc/def/linkedlist.html