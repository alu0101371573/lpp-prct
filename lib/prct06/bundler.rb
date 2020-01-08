require "prct06/bundler/version"

module Prct06
  	module Bundler
	    class Error < StandardError; end
		
		##
		# Class that rapresents an Aliment which is described by a name,
		# the grams of co2 emitted per kg of produced Aliment,
		# the m^2 per year used in order to produce it,
		# and then we have the energy informations which is described by the amount
		# of carbs, proteins and fat contained in 100g of the Aliment.
		class Alimento
			include Comparable
			attr_reader :name, :gei, :terreno, :proteins, :carbs, :lipidos, :geiPerKg

		  	def <=>(other)
		  	  	get_energia <=> other.get_energia
		  	end
			
			##
			# The initializer of the class has an attribute called porcions which
			# is used to indicate if we want more than 100g of the Aliment.
			# So, for example, if we wanted 200g of Chicken we would instantiate
			# an object with porcions=2
			def initialize(name, porcions=1, geiPerKg, terreno, carbs, proteins, lipidos)
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

			##
			# We assume that each gram of carb is equal to 4 kcal
			def get_energia_carbs
				@carbs * 4
			end

			##
			# We assume that each gram of protein is equal to 4 kcal
			def get_energia_proteins
				@proteins * 4
			end

			##
			# We assume that each gram of fat is equal to 9 kcal
			def get_energia_lipidos
				@lipidos * 9
			end

			##
			# Method to get the total kcal of 'porcions'*100g of the Aliment-
			# using the assumptions that:
			# each gram of fat is equal to 9 kcal;
			# each gram of protein is equal to 4 kcal;
			# each gram of carb is equal to 4 kcal.
			def get_energia
				@lipidos * 9 + @proteins * 4 + @carbs * 4
			end

			##
			# The nutricional indicator of an Aliment is described by a number
			# from 0 to 3 which means that the food has a Low nutricional impact
			# if this item is within 0 and 1; it has a Regular impact if it's within
			# 1 and 2 or an High impact if it's withing 2 and 3.
			def nutricional_indicator()
				(indicator_energia() + indicator_carbono())/2
			end
			
			##
			# This method calculated the energy indicator, also a number which ranges from 0 to 3
			# it equals 1.0 if the kcal of the aliment is less than 670;
			# it equals 2.0 if the kcal of the aliment is greater than 670 and less than or equal to 830;
			# otherwise it will equals 3.0
			def inidicator_energia()
				e = get_energia()

				if e < 670
					return 1.0
				elsif e <= 830
					return 2.0
				else
					return 3.0
				end
			end

			##
			# @gei contains the g of co2 to produce the aliment
			# I think that the indicators shown in the practice description
			# might be wrong because it's impossible that to have a regular impact
			# an aliment need to have 1kg of co2 emissions to be produced.
			def indicator_carbono()
				if @gei < 8.0
					return 1.0
				elsif @gei <= 12.0
					return 2.0
				else
					return 3.0
				end
			end
		end

		##
		# Class for representing a Plate which is formed by one or more Aliment;
		# it has a name, a list of aliments and also for each aliment we store in a list
		# the amount of it in grams
		class Plato
			attr_reader :plateName, :alimentsList, :gramsList

			def initialize(name, alimentsList=nil, gramsList=nil, &block)
				@plateName = name
				if alimentsList != nil
					@alimentsList = alimentsList
					@gramsList = gramsList
				else
					@alimentsList = List.new
					@gramsList = List.new
				end

				if block_given?
					if block.arity == 1
					  	yield self
					else
					 	instance_eval(&block) 
					end
				end
			end

			def nombre(name)
				@plateName = name
			end

			def alimento(opt)
				@alimentsList.push(opt[:descripcion])
				@gramsList.push(opt[:gramos])
			end

			##
			# Calculates the % of proteins which composes the Dish
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

			##
			# Calculates the % of carbs which composes the Dish
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

			##
			# Calculates the % of fat which composes the Dish
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

			##
			# Calculates the total energy value in kcal of the Dish
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

			##
			# The energy indicator of a plate is defined as the average of the energy indicators
			# of each single aliment which forms the Dish	
			def indicator_energia()
				e = totalCaloricValue() / @alimentsList.length

				if e < 670
					return 1.0
				elsif e <= 830
					return 2.0
				else
					return 3.0
				end
			end

			def nutricional_indicator()
				(indicator_energia() + indicator_carbono())/2
			end

			##
			# The co2 indicator of a plate is defined as the average of the co2 indicators
			# of each single aliment which forms the Dish	
			def indicator_carbono()
				c = totalGei() / @alimentsList.length
				# c is the avg grams of co2 per plate

				if c < 670
					return 1.0
				elsif c <= 830
					return 2.0
				else
					return 3.0
				end
			end

			def to_s
				return @plateName
			end
		end

		##
		# A menu is formed by a set of dishes each associated with their prices.
		# The menu also has a name and a total price.
		# Remember that a Dish (Plato) is itself defined by a set of Aliments
		# each associated with the amount of grams.
		class Menu
			
		end

		##
		# A subclass of the Plato class which extends the behaviour by defining
		# methods to get the total co2 emissions required to cook the dish;
		# and also the total amount of m^2 per year of ground used to grow the food.
		class PlatoExtended < Plato
			include Comparable

			def <=>(other)
				totalCaloricValue() <=> other.totalCaloricValue()
			end

			##
			# Returns the total amount of co2 required to produce the Dish.
			def totalGei()
				# geiPer1000g = geiPerKg / 1000
				# geiPerXgrams = (geiPer1000g * Xgrams) / 1000

				plato = alimentsList.head
				grams = gramsList.head

				totalGetC = 0.0

				while plato != nil
					geiPer1000g = plato.value.geiPerKg()
					geiPerXgrams = (geiPer1000g * grams.value) / 1000

					totalGetC += geiPerXgrams

					plato = plato.next
					grams = grams.next
				end

				return totalGetC
			end

			##
			# Returns the total amount of ground required to grow the foods used in the Dish.
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

			##
			# Method to pretty-print the energy informations of the Dish
			# as the percentages of carbs, proteins and fat
			def energyEfficiency()
				"Carbs " + carbsPercent().round(2).to_s + "%,\nProteins " + proteinsPercent().round(2).to_s + "%\nLipids " + lipidsPercent().round(2).to_s + "%\n"
			end
		end

		##
		# Class which describes a double-linked List
		# it provides O(1) access to the head and the tail of the list as well as the length of it.
		class List
			include Enumerable
			attr_reader :head, :tail, :length

			##
			# Lists are considered to be equal if and only if they have the same elements,
			# in the same order.
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

			##
			# Pretty-print the elements of the list
			def to_s
				'[' << map(&:to_s).join(', ') << ']'
			end

			def each()
				if @head
					yield @head.value
					@head.next.each if @head.next
				end
			end

			# def each(&block)
			#     block.call(@head.value)
			#     @tail.each(&block) if @tail
		 #  	end

			def each(&block)
				temp = @head
				while temp != nil
					block.call(temp.value)
					temp = temp.next
				end
			end

			def initialize
				@length = 0
			end

			def newNode(prevN, valueN, nextN)
				Struct.new(:prev, :value, :next).new(prevN, valueN, nextN)
			end

			##
			# Push in the tail of the list a new node containing the 'value'
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

			##
			# Pop the last element of the list.
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

			##
			# Method to get the element at the specified position.
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

			##
			# Method to remove an element at the specified position
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

			##
			# Method used to insert an element in a specific position
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
			
		
	

