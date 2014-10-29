# -*- coding: utf-8 -*-
require_relative 'cell'
class Universe
	attr_accessor :matrix

	def initialize(total)
		@matrix = Array.new(total) { Array.new(total) }
	end

	def fillUniverse
		@matrix.count.times do |x|
			@matrix.count.times do |y|
				@matrix[x][y] = Cell.new(x,y,Random.rand(2))
				print "#{x},#{y}|#{@matrix[x][y].status} - "
			end
			print "\n"
		end
		print "\n"
	end

	def countNeighbors(currentX, currentY)
		count = 0
		x=-1
		y=-1
		x.upto(x+2) do |xx|
		    y.upto(y+2) do |yy|
		    	if(xx!=0 || yy!=0) #ignore when 0,0
					#as -1 fix automatically to the last position of the array
					#i have to make last+1 becomes 0
					if (currentX+xx == @matrix.count)
						actualX = 0
					else
						actualX = currentX + xx
					end

					if (currentY+yy == @matrix.count)
						actualY = 0
					else
						actualY = currentY + yy
					end
					
					#get the cell from tha position
					cell = @matrix[actualX][actualY]
					#check if it's alive
					if (cell.isAlive?)
						count += 1
					end
				end
		    end
		end
		return count
	end

	def walkTheUniverse
		@matrix.count.times do |x|
			@matrix.count.times do |y|
				cell = @matrix[x][y]
				neighbors = countNeighbors(cell.positionX, cell.positionY)
				print "#{cell.isAlive?} - #{cell.positionX},#{cell.positionY} - #{neighbors}"
				if (cell.isAlive?)
					if (neighbors<2) || (neighbors>3)
						cell.die
						print " die"
					end
				else
					if (neighbors==3)
						cell.live
						print " live"
					end
				end
				print "\n"
			end
			print "-\n"
		end
	end

	def drawSpace
		print "\n"
		@matrix.count.times do |x|
			@matrix.count.times do |y|
				cell = @matrix[x][y]
				if (cell.status == 1)
					print "█"
				else
					print " "
				end
			end
			print "\n"
		end
		print "\n"
	end
end

##For testing purposes
univ = Universe.new(10)
univ.fillUniverse
univ.drawSpace
10.times do
	#system ("cls")
	univ.walkTheUniverse
	univ.drawSpace
	sleep 1.5 # seconds
end