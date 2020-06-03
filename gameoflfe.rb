class Game
	@@tablero = nil
	@@width = 0
	@@height = 0
	def initialize
		# => 
	end
	def cell(x,y)
		@tablero[x + (y*@width)]
	end
	def initTable
		@width = 80
		@height = 23
		@tablero = Array.new(23*80) {nil}
	end
	def initTable(x,y)
		@width = x
		@height = y
		@tablero = Array.new(@width*@height) {nil}
	end
	def gexec
		table = Array.new(@width*@height) { nil }
		(0..@width-1).each do |i|
			(0..@height-1).each do |j|
				flag = 0
				if (i > 0) && (j > 0) 
					if @tablero[(i - 1) + ((j-1)*@width)]
						flag = flag + 1
					end
				end
				if (j > 0) 
					if @tablero[(i) + ((j-1)*@width)]
						flag = flag + 1
					end
				end
				if (i < @width-1) && (j > 0) 
					if @tablero[(i + 1) + ((j-1)*@width)]
						flag = flag + 1
					end
				end
				if (i > 0)
					if @tablero[(i - 1) + ((j)*@width)]
						flag = flag + 1
					end
				end
				if (i < @width-1) 
					if @tablero[(i + 1) + ((j)*@width)]
						flag = flag + 1
					end
				end
				if (i > 0) && (j < @height-1) 
					if @tablero[(i - 1) + ((j+1)*@width)]
						flag = flag + 1
					end
				end
				if (j > @height-1) 
					if @tablero[(i) + ((j+1)*@width)]
						flag = flag + 1
					end
				end
				if (i < @width-1) && (j > @height-1) 
					if @tablero[(i + 1) + ((j+1)*@width)]
						flag = flag + 1
					end
				end
				 
				if @tablero[i+(j*@width)] && ( !(flag-2) || !(flag-3) )
					table[i+(j*@width)] = 1
				else
					table[i+(j*@width)] = nil
				end

				if !@tablero[i+(j*@width)] && !(flag-3)
					table[i+(j*@width)] = 1
				end
			end
		end
		@tablero = table.clone
	end
	def gprint
		system "clear"
		(0..@width-1).each do |i|
			(0..@height-1).each do |j|
				if @tablero[i+(j*@width)]
					print 177
				else
					print 178
				end
			end
			print "\n"
		end
	end
	def game
		while 1 do
			self.gexec
			self.gprint
			sleep(1)
		end
	end
end



def main
	aux = nil
	x = nil
	y = nil
	tablero = Game.new
	tablero.initTable

	print "Hola, el juego se ejecutará en resolucion 80x23, deseas cambiarlo? s/n"
	gets x
	if x == 's'
		print "No. de filas"
		gets x
		print "No. de columnas"
		gets y
		tablero.initTable(x,y)
	end

	tablero.cell(10,10)
	tablero.cell(10,11)
	tablero.cell(10,12)
	tablero.cell(10,13)
	tablero.cell(10,14)
	tablero.cell(11,11)
	tablero.cell(11,12)
	tablero.cell(11,13)
	tablero.cell(12,12)

	puts "Comenzando el juego, presiona cualquier tecla"
	puts "Al inicial presiona cualquier tecla para terminar"
	gets aux

	hilo = Thread.start{ tablero.game }
	gets aux
	Thread.kill(hilo)
end

main