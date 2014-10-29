class Cell
	attr_accessor :positionX, :positionY, :status

	def initialize(px, py, status)  
    	@positionX = px
    	@positionY = py
    	@status = status
  	end

  	def isAlive?
  		if @status == 1
  			return true
  		else
  			return false
  		end
  	end

  	def die
  		@status = 0
  	end

  	def live
  		@status = 1
  	end
end