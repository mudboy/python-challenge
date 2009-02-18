# Level 4 has a picture that takes you to page which says:
# and the next nothing is 92512
# the page url is http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=12345

require 'open-uri'

nothing = 12345
url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
done = false

while !done
	puts nothing
    open("#{url}#{nothing}") do | page |
        message = page.read
        number = message.match(/\d+$/)
        if number.nil?
            if message.match(/Divide/)
                nothing = nothing / 2
            else
                done = true
                puts "the answer is: #{message}"
            end
        else
            nothing = number[0].to_i
        end
    end
end
