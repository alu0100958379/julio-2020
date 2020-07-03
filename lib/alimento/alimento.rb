#Clase Alimento que representa un alimento con sus valores
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

#Clase para representar Listas doblemente enlazadas
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

#Clase para representar un plato
class Plato

	attr_accessor :name, :al, :gr, :huella

	def initialize(name,al,gr)
		@name = name
		@al = al
		@gr = gr
		@huella = 0
	end
	
	def valorCalorico
		sum = 0
		al.collect{|x| sum += x.energia}
		return sum*7
	end
end

#Clase hija heredada de la clase Plato
class PlatoHijo < Plato

	include Comparable

	def valorGases
		sum = 0
		al.collect{|x| sum += x.gases}
		return sum
	end

	def impacto_gases
		if valorGases < 800
			return 1
		else 
			if (valorGases > 1200)
				return 3
			end
		end
		return 2
	end

	def impacto_energia
		if (valorCalorico < 670)
                        return 1
                else 
			if (valorCalorico > 830)
                        	return 3
			end
		end
		return 2
	end
	
	def get_huella
		return (impacto_energia + impacto_gases)/2
	end

	def to_s
		"Eficiencia energética: #{valorCalorico()}"
	end

	def <=>(rhs)
		valorCalorico <=> rhs.valorCalorico
	end
end

#Clase para representar Menus
class Menu

	include Enumerable

	attr_accessor :A_platos, :A_precios

	def initialize(platos,precio)
		@A_platos = platos
		@A_precios = precio
	end

	def each
		@A_platos.collect{|x| yield x}
	end

end
