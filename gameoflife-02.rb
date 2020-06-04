class Game
	def initialize
		@width = 80
		@height = 23
		@tablero = Array.new(@width*@height) { nil }
	end
	def initialize(x,y)
		@width = x
		@height = y
		@tablero = Array.new(@width*@height) { nil }	
	end
	def game
		# => 
		# => 
	end

	private
		@width = nil
		@height = nil
		@tablero = nil

		def gprint
			system "clear"
			for i in 0..@width
				for j in 0..@height
					if @tablero[i+(j*@width)]
						print 177
					else
						print 178
					end
				end
				print "\n"
			end
		end

		def gexec
			tablero = Array.new(@width*@height) { nil }
			for i in 0..@width
				for j in 0..@height

					if (i>0) && (j>0)
						if @tablero[(i-1)+((j-1)*@width)]
							flag = flag + 1
						end
					end

					if (j>0)
						if @tablero[(i)+((j-1)*@width)]
							flag = flag + 1
						end
					end

					if (i<@width-1) && (j>0)
						if @tablero[(i+1)+((j-1)*@width)]
							flag = flag + 1
						end
					end

					if (i>0)
						if @tablero[(i-1)+((j)*@width)]
							flag = flag + 1
						end
					end

					if (i<@width-1)
						if @tablero[(i+1)+((j)*@width)]
							flag = flag + 1
						end
					end

					if (i>0) && (j<@height-1)
						if @tablero[(i-1)+((j+1)*@width)]
							flag = flag + 1
						end
					end

					if (j<@height-1)
						if @tablero[(i)+((j+1)*@width)]
							flag = flag + 1
						end
					end

					if (i<@width-1) && (j<@height-1)
						if @tablero[(i+1)+((j+1)*@width)]
							flag = flag + 1
						end
					end

					if @tablero[i+(j*@width)] && (!(flag-2) || !(flag-3))
						tablero[i+(j*@width)] = 1
					else
						tablero[i+(j*@width)] = nil
					end

					if !@tablero[i+(j*@width)] && !(flag-3)
						tablero[i+(j*@width)] = 1
					end

				end
			end
			@tablero = tablero.clone
		end
			
		end


end

def main
	juego = Game.new(100,100)
	puts "Hola mundo"
end

main