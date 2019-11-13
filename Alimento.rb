
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

	def get_gei
		@gei
	end

	def get_ground
		@terreno
	end
end