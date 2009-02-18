# url is: http://www.pythonchallenge.com/pc/hex/ambiguity.html
# pw is butter/fly
require 'RMagick'
   
   include Magick
   
   $DEBUG = false
   
   class Maze
       def initialize(m, width, height, start, finish)
           @maze = m
           @width = width
           @height = height
           @start = start
           @finish = finish
           @path = [] # array of pos
           @visited = []
           @wall = Pixel.from_color('white')
       end
       
       def path
           raise "maze not solved" if @path.empty?
           @path
       end
       
       def solve
           count = 0 # safety count
           
           @pos = @start
           
           while @pos != @finish && count < 100000
               count += 1
               x, y = pos2coord(@pos)
               puts "(#{x},#{y})" if $DEBUG
               down = coord2pos(x, y+1)
               left = coord2pos(x-1, y)
               right = coord2pos(x+1, y)
               up = coord2pos(x, y-1)
               
               if valid?(down)
                   puts 'down' if $DEBUG
                   @pos = down
                   visit(@pos)
               elsif valid?(left)
                   puts 'left' if $DEBUG
                   @pos = left
                   visit(@pos)
               elsif valid?(right)
                   puts 'right' if $DEBUG
                   @pos = right
                   visit(@pos)
               elsif valid?(up)
                   puts 'up' if $DEBUG
                   @pos = up
                   visit(@pos)
               else
                   puts 'bactrack' if $DEBUG
                   @pos = bactrack
                   count -= 1                
               end
           end
       end
       
   
   private
       def coord2pos(x, y)
           (y % @height) * @width + (x % @width) 
       end
       
       def pos2coord(p)
           [p % @width, (p / @width) % @height]
       end
       
       def wall?(pos)
           @maze[pos] == @wall
       end
       
       def valid?(pos)
           !wall?(pos) && !@visited[pos]
       end
       
       def visit(pos)
           @visited[pos] = true
           @path << pos
       end
       
       def bactrack
           @path.pop
           @path.last
       end
   end
   
   img = Image.read('maze.png').first
   
   maze = img.get_pixels(0, 0,img.columns, img.rows)
   
   m = Maze.new(maze, img.columns, img.rows, 639, 410241)
   m.solve
           
   File.open('out.zip', 'w+b') do |f|
       m.path.each do |pos|
           f.write(maze[pos].red.chr) if pos % 2 == 0
       end
   end
   # the answer is lake
   # the next url is http://www.pythonchallenge.com/pc/hex/lake.html