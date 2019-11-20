require "prct06/bundler/version"

module Prct06
  module Bundler
    class Error < StandardError; end
    
	class Alimento
		attr_reader :name, :gei, :terreno, :proteins

		def initialize(name, porcions, geiPerKg, terreno, carbs, proteins, lipidos)
			@name = name
			@geiPerKg = porcions*geiPerKg
			@gei = (@geiPerKg / 1000) * porcions * 100
			@terreno = porcions*terreno
			@carbs = porcions*carbs
			@proteins = porcions*proteins
			@lipidos = porcions*lipidos
		end

		def get_info
			@name + "\ngei: " + @gei + " terreno: " + @terreno + " carbs: " + @carbs + "g  proteins: " + @proteins + "g  Lipidos: " + @lipidos + "g"
		end

		def get_energia
			@lipidos * 9 + @proteins * 4 + @carbs * 4
		end
	end

	class List
		attr_reader :head, :tail, :length

		def initialize
			@length = 0
		end

		def newNode(prevN, valueN, nextN)
			Struct.new(:prev, :value, :next).new(prevN, valueN, nextN)
		end

		def push(value)
			if @length == 0
				@head = @tail = newNode(nil, value, nil)
			else
				@tail.next = newNode(@tail, value, nil)
				@tail = @tail.next

				if @length == 1
					@head.next = @tail
				end
			end

			@length += 1
		end

		def pop
			if @length == 0
				raise RuntimeError.new("Cannot pop from empty list.")
			else
				if @tail.prev == nil
					# there is only one element
					@head = nil
					@tail = nil
				else
					@tail.prev.next = nil
					@tail = @tail.prev
				end
				@length -= 1
			end
		end
	end

  end
end
