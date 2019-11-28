require "prct06/bundler/version"

module Prct06
  	module Bundler
	    class Error < StandardError; end
	    
		class Alimento
			include Comparable
			attr_reader :name, :gei, :terreno, :proteins, :carbs, :lipidos, :geiPerKg

		  	def <=>(other)
		  	  	self.get_energia <=> other.get_energia
		  	end

			def initialize(name, porcions, geiPerKg, terreno, carbs, proteins, lipidos)
				@name = name
				@geiPerKg = porcions*geiPerKg
				@gei = (@geiPerKg / 1000) * porcions * 100
				@terreno = porcions*terreno
				@carbs = porcions*carbs
				@proteins = porcions*proteins
				@lipidos = porcions*lipidos
			end

			def to_s
				return @name
			end

			def get_info
				@name + "\ngei: " + @gei + " terreno: " + @terreno + " carbs: " + @carbs + "g  proteins: " + @proteins + "g  Lipidos: " + @lipidos + "g"
			end

			def get_energia_carbs
				@carbs * 4
			end

			def get_energia_proteins
				@proteins * 4
			end

			def get_energia_lipidos
				@lipidos * 9
			end

			def get_energia
				@lipidos * 9 + @proteins * 4 + @carbs * 4
			end
		end

		class Plato
			attr_reader :plateName, :alimentsList, :gramsList

			def initialize(name, alimentsList, gramsList)
				@plateName = name
				@alimentsList = alimentsList
				@gramsList = gramsList
			end

			def proteinsPercent()
				plato = @alimentsList.head
				grams = @gramsList.head
				totalEnergy = 0.0
				totalProteinsEnergy = 0.0

				while plato != nil
					totalEnergy += (plato.value.get_energia * grams.value) / 100
					totalProteinsEnergy += (plato.value.get_energia_proteins * grams.value) / 100

					plato = plato.next
					grams = grams.next
				end

				return (totalProteinsEnergy * 100) / totalEnergy
			end

			def carbsPercent()
				plato = @alimentsList.head
				grams = @gramsList.head
				totalEnergy = 0.0
				totalCarbsEnergy = 0.0

				while plato != nil
					totalEnergy += (plato.value.get_energia * grams.value) / 100
					totalCarbsEnergy += (plato.value.get_energia_carbs * grams.value) / 100

					plato = plato.next
					grams = grams.next
				end

				return (totalCarbsEnergy * 100) / totalEnergy
			end

			def lipidsPercent()
				plato = @alimentsList.head
				grams = @gramsList.head
				totalEnergy = 0.0
				totalLipidsEnergy = 0.0

				while plato != nil
					totalEnergy += (plato.value.get_energia * grams.value) / 100
					totalLipidsEnergy += (plato.value.get_energia_lipidos * grams.value) / 100

					plato = plato.next
					grams = grams.next
				end

				return (totalLipidsEnergy * 100) / totalEnergy
			end

			def co2Percent()

			end

			def totalCaloricValue()
				plato = @alimentsList.head
				grams = @gramsList.head
				total = 0.0

				while plato != nil
					total += (plato.value.get_energia() * grams.value) / 100
					plato = plato.next
					grams = grams.next
				end

				return total
			end

			def to_s

			end
		end

		class PlatoExtended < Plato
			include Comparable

			def <=>(other)
				totalCaloricValue() <=> other.totalCaloricValue()
			end

			def totalGei
				# geiPer1000g = geiPerKg / 1000
				# geiPerXgrams = (geiPer1000g * Xgrams) / 1000

				plato = alimentsList.head
				grams = gramsList.head

				totalGetC = 0.0

				while plato != nil
					geiPer1000g = plato.value.geiPerKg() / 1000
					geiPerXgrams = (geiPer1000g * grams.value) / 1000

					totalGetC += geiPerXgrams

					plato = plato.next
					grams = grams.next
				end

				

				return totalGetC
			end

			def totalTerreno()
				# terreno = (terreno * grammi) / 100

				plato = alimentsList.head
				grams = gramsList.head

				totalTerreno = 0.0

				while plato != nil
					totalTerreno += (plato.value.terreno * grams.value) / 100

					plato = plato.next
					grams = grams.next
				end

				return totalTerreno
			end

			def energyEfficiency()
				"Carbs " + carbsPercent().round(2).to_s + "%,\nProteins " + proteinsPercent().round(2).to_s + "%\nLipids " + lipidsPercent().round(2).to_s + "%\n"
			end
		end

		class List
			include Enumerable
			attr_reader :head, :tail, :length

			def <=>(other)
				if @length < other.length
					return -1
				elsif @length > other.length
					return 1
				else
					# Check every element
					temp1 = @head
					temp2 = other.head

					while temp1 != nil
						if (temp1.value <=> temp2.value) != 0
							return temp1.value <=> temp2.value
						end

						temp1 = temp1.next
						temp2 = temp2.next
					end

					return 0
				end
			end

			def to_s
				'[' << map(&:to_s).join(', ') << ']'
			end

			def each
				if @head
					yield @head
					@head.next.each if @head.next
				end
			end

			def each(&block)
			    block.call(@head)
			    @tail.each(&block) if @tail
		  	end

			#def each(&block)
			#	if @head
			#		block.call(@head)
			#		@head.next.each(block) if @head.next
			#	end
			#end

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

			def _get_at_list(current, position)
				if position == 0
					return current
				else
					return _get_at_list(current.next, position - 1)
				end
			end

			def get_at(position)
				if @head != nil && position >= 0 && position < @head.length
					# TODO: could be improved by looking backworkds from tail if position is nearear length than 0
					return _get_at_list(@head, position)
				else
					raise RuntimeError.new("The specified position is outside [0; list lenght] or the list has no elements.")
				end
			end

			def _remove_head()
				@head = @head.next
				if @head != nil
					@head.prev = nil
				else
					@tail = nil
				end
				@length -= 1
			end

			def _remove_in_list(head, position)
				if position == 0
					head.prev.next = head.next
					head.next.prev = head.prev
				else
					_remove_in_list(head.next, position - 1)
				end
			end

		
			def remove_at(position)
				if @head != nil
					if position == 0
						_remove_head()
					elsif position == @length -1
						pop()
					elsif position < @length
						_remove_in_list(@head, position)
						@length -= 1
					else
						raise RuntimeError.new("position out of range")
					end
				else
					raise RuntimeError.new("Cannot remove elements from empty list.")
				end
			end

			def _insert_in_list(head, position, element)
				if position == 0
					node = newNode(head.prev, element, head)
					head.prev.next = node
					head.prev = node
				else
					_insert_in_list(head.next, position - 1, element)
				end
			end


			def insert_at(position, element)
				if position == 0
					@head = newNode(nil, element, @head)
					if tail == nil
						@tail = @head
					end
				elsif position == @length
					if @tail == nil
						@tail = newNode(@head, element, nil)
						@head.next = @tail
					else
						@tail = newNode(@tail, element, nil)
						@tail.prev.next = @tail
					end
				elsif position < @length
					_insert_in_list(@head.next, position - 1, element)
				else
					raise RuntimeError.new("position must be in range")
				end
				@length += 1
			end

		end	
	end
end
			
		
	

