# the url is: http://huge:file@www.pythonchallenge.com/pc/return/disproportional.html
require 'xmlrpc/client'

url = 'http://huge:file@www.pythonchallenge.com/pc/phonebook.php'
phonebook = XMLRPC::Client.new2(url).proxy
puts phonebook.phone('Bert')

# the answer is 555-ITALY
# next url is: http://huge:file@www.pythonchallenge.com/pc/return/italy.html