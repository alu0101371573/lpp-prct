
class Alimento
	attr_reader :name, :gei, :terreno

	def initialize(name, gei, terreno, carb, protein, lipidos)
		@name = name
		@gei = gei
		@terreno = terreno
		@carb = carb
		@protein = protein
		@lipidos = lipidos
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

	def get_info
		@name + " " + @gei + " " + @terreno + " " + @carb + " " + @protein + " " + @lipidos
	end
end