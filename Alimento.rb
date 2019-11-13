
class Alimento
	attr_reader :name, :gei, :terreno

	def initialize(name, gei, terreno)
		@name = name
		@gei = gei
		@terreno = terreno
	end
end