# Level ones clue is a picture of a piece of paper
# with the following on it: K->M O->Q E->G.
# Also the page is the following encoded message.
message = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr
amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr 
ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle 
qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

puts message.tr('a-z','c-zab')

# result
"i hope you didnt translate it by hand. thats what
computers are for. doing it in by hand is inefficient 
and that's why this text is so long. using 
string.maketrans() is recommended. now apply on the url."

# the url has the letters map in it

puts "map".tr('a-z','c-zab')

# resut is "ocr"