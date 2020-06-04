class Gameoflife
	def initialize
		
	end

	def initTable
		@width = 23
		@height = 80
		@tablero = Array.new(@width) {Array.new(@height) {nil}}
	end

	def initTable(x, y)
		@width = x
		@height = y
		@tablero = Array.new(@width) {Array.new(@height) {nil}}
	end
	
	def game
		while 1 do
			self.gprint
			self.gexec
			sleep(1)
		end
	end

	def cell(x,y)
		# => 
		# => 
		@tablero[x][y] = 1
	end

	private
	@width = 0
	@height = 0
	@tablero = nil

	def gprint
		system "clear"
		for i in 0..@width-1
			for j in 0..@height-1
				if @tablero[i][j]
					print "*"
				else
					print " "	
				end
			end
			print "\n"
		end
	end

	def gexec
		tablero = Array.new(@width) {Array.new(@height) {nil}}
		for i in 0..@width-1
			for j in 0..@height-1
				flag=0
				if (i>0) && (j>0)
					if @tablero[i-1][j-1]
						flag = flag+1
					end
				end
				if (j>0)
					if @tablero[i][j-1]
						flag = flag+1
					end
				end
				if (i<@width-1) && (j>0)
					if @tablero[i+1][j-1]
						flag = flag+1
					end
				end
				if (i>0)
					if @tablero[i-1][j]
						flag = flag+1
					end
				end
				if (i<@width-1)
					if @tablero[i+1][j]
						flag = flag+1
					end
				end
				if (i>0) && (j<@height-1)
					if @tablero[i-1][j+1]
						flag = flag+1
					end
				end
				if (j<@height-1)
					if @tablero[i][j+1]
						flag = flag+1
					end
				end
				if (i<@width-1) && (j<@height-1)
					if @tablero[i+1][j+1]
						flag = flag+1
					end
				end

				if @tablero[i][j] && ( (flag==2) || (flag==3) )
					tablero[i][j]= 1
				else
					tablero[i][j]= nil
				end

				if !@tablero[i][j] && (flag==3)
					tablero[i][j] = 1
				end

			end
		end

		@tablero = tablero.clone
	end
end

def main
	game = Gameoflife.new

	game.initTable(23,80)
	aux = nil

	game.cell(10,10)
	game.cell(10,11)
	game.cell(10,12)
	game.cell(10,13)
	game.cell(10,14)
	game.cell(11,11)
	game.cell(11,12)
	game.cell(11,13)
	game.cell(12,12)


	hilo = Thread.start{ |x| game.game}
	aux = gets.strip
	Thread.kill(hilo)

end

main