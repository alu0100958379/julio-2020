class Alim

	include Comparable

	attr_accessor :nombre, :energia

	def initialize(nombre, energia)
		@nombre = nombre
		@energia = energia
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
