class Unpickler
   def initialize
     @mark, @memo, @stack = Object.new, {}, []
   end
 
   def marker
     @stack.rindex @mark
   end
 
   def load(stream)
     loop do
       case stream.getc.chr
       when "I" # add an int to the stack
         @stack << stream.readline.chomp.to_i
       when "S" # add a string to the stack
         @stack << eval(stream.readline.chomp)
       when "t", "l" # e.g) ... [ 1,2,MARKER,3,4 ] => [ 1,2,[3,4] ]
         @stack[marker..-1] = [ @stack[marker+1..-1] ]
       when "("
         @stack << @mark
       when "a" # e.g) ... [ [ ],1,2 ] => [ [ 1, 2] ]
        v = @stack.pop; @stack.last << v
       when "p"
         @memo[stream.readline.chomp] = @stack.last
       when "g"
         @stack << @memo[stream.readline.chomp]
       when "."
         return @stack.pop
       end
     end
   end
 end
 
 if $0 == __FILE__ and ARGV.length == 1
   banner = ARGV.first
   puts Unpickler.new.load(open(banner)).map{|row|row.inject(""){|r,(k,v)|r+=k*v}}
 end