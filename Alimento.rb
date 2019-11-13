
class Alimento
	attr_reader :name, :gei, :terreno

	def initialize(name, gei, terreno)
		@name = name
		@gei = gei
		@terreno = terreno
	end

	def get_name
		@name
	end	
end