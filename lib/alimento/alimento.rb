class Alim

	include Comparable

	attr_accessor :nombre, :energia, :gases

	def initialize(nombre, energia, gases)
		@nombre = nombre
		@energia = energia
		@gases = gases
	end

	def <=>(rhs)
		@energia <=> rhs.energia
	end

end

Node = Struct.new(:value, :next, :prev)

class List

	include Enumerable

	attr_accessor :size, :head, :tail

	def initialize
		@size = 0
		@tail = Node.new(nil,nil,nil)
		@head = Node.new(nil,nil,nil)
	end

	#Método para introducir en la lista
        def push(valor)
                node = Node.new(valor,nil,nil)
                if (@size == 0)
                        @tail = node
                        node.next = nil
                else
                        @head.prev = node
                        node.next = @head
                end
                @head = node
                node.prev = nil
                @size = @size + 1
        end

	def each
		node = @head
		while(node != nil)
			yield node.value
			node = node.next
		end
	end

end


class Plato

	attr_accessor :name, :al, :gr, :huella

	def initialize(name,al,gr)
		@name = name
		@al = al
		@gr = gr
	end
	
	def valorCalorico
		sum = 0
		al.collect{|x| sum += x.energia}
		return sum*7
	end
end

class PlatoHijo < Plato

	include Comparable

	def valorGases
		sum = 0
		al.collect{|x| sum += x.gases}
		return sum
	end

	def to_s
		"Eficiencia energética: #{valorCalorico()}"
	end

	def <=>(rhs)
		valorCalorico <=> rhs.valorCalorico
	end
end


class Menu

	include Enumerable 

	attr_accessor :lista_de_platos

	def initialize
		@lista_de_platos = Array.new
		@indicador = 0
	end

	def push(plato)
        #       sum = plato.al.collect{|x| sum += x.energia}
		@lista_de_platos.push(plato)
	#	@indicador += sum
	end

	def each
		yield @lista_de_platos
	end	

end
