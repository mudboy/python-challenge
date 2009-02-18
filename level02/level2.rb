# Level 2 says to look in the page source
# where you the message:
# find rare characters in the mess below
# I copied the mess to data.txt

File.open('data.txt', 'rb') do |file|
    data = file.read
    puts data.scan(/[a-z]/).join
end

# result: equality

    