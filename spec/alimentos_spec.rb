load "Alimento.rb"

RSpec.describe Alimento, "#name" do
	# Debe existir un nombre para el alimento.
	context "after simple .new" do
		it "should return the name of the aliment" do
			comida = Alimento.new("name1")
			expect(comida.name).to eq "name1"
		end
	end
end


# Debe existir la candidad de emisi´on de gases de efecto invernadero en kgCO2eq.
# Debe existir la candidad de terreno utilizado en m2a˜no.
# Existe un m´etodo para obtener el nombre del alimento.
# 2
# Existe un m´etodo para obtener las emisiones de gases de efecto invernadero.
# Existe un m´etodo para obtener el terreno utilizado.
# Existe un m´etodo para obtener el alimento formateado.
# Existe un m´etodo para obtener el valor energ´etico de un alimento.
# Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 a˜nos.
# Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 a˜nos.