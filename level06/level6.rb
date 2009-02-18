require 'rubygems'
require 'zip/zip'

Zip::ZipFile.open("channel.zip") do |file|
    output = ""
    nothing = 90052
    begin
        while true
            nothing = file.read("#{nothing}.txt").scan(/\d+$/)
            output << file.get_entry("#{nothing}.txt").comment
        end
    rescue
        puts output
    end
end

# the output is as follows
#***************************************************************
#****************************************************************
#**                                                            **
#**   OO    OO    XX      YYYY    GG    GG  EEEEEE NN      NN  **
#**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE  NN    NN   **
#**   OO    OO XXX  XXX YYY   YY  GG GG     EE       NN  NN    **
#**   OOOOOOOO XX    XX YY        GGG       EEEEE     NNNN     **
#**   OOOOOOOO XX    XX YY        GGG       EEEEE      NN      **
#**   OO    OO XXX  XXX YYY   YY  GG GG     EE         NN      **
#**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE     NN      **
#**   OO    OO    XX      YYYY    GG    GG  EEEEEE     NN      **
#**                                                            **
#****************************************************************
# **************************************************************
# url = http://www.pythonchallenge.com/pc/def/oxygen.html
