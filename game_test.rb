require 'minitest/autorun'
require_relative 'cell'
require_relative 'universe'

class GameTest < MiniTest::Unit::TestCase
	
	def setup
	    @aliveCell = Cell.new(0,0,1)
    	@deadCell = Cell.new(0,0,0)
    	@universe = Universe.new(10)
  	end

	def test_is_cell_object
		assert_instance_of Cell, Cell.new(0,0,1)
	end

	def test_is_alive
		assert_equal true, @aliveCell.isAlive?
	end

	def test_is_dead
		assert_equal false, @deadCell.isAlive?
	end

	def test_kill_cell
		@aliveCell.die
		assert_equal false, @aliveCell.isAlive?
	end

	def test_revive_cell
		@deadCell.live
		assert_equal true, @deadCell.isAlive?
	end

	def test_positionX_is_number
		assert_instance_of Fixnum, @aliveCell.positionX
	end

	def test_positionY_is_number
		assert_instance_of Fixnum, @aliveCell.positionY
	end

	def test_Universe
		assert_instance_of Array, @universe.matrix
	end

	def test_Total_Universe
		assert_equal 10, @universe.matrix.length
	end
	
end