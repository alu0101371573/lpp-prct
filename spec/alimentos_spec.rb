load "Alimento.rb"

RSpec.describe Alimento do
	# Debe existir un nombre para el alimento.
	context "after simple .new" do
		it "should return the name of the aliment" do
			comida = Alimento.new("name1", 50.0, 164.0)
			expect(comida.name).to eq "name1"
		end
	end

	# Debe existir la candidad de emisi´on de gases de efecto invernadero en kgCO2eq.
	context "after simple .new" do
		it "should exist the amount of gas emissions (in kgCO2eq)" do
			comida = Alimento.new("name1", 50.0, 164.0)
			expect(comida.gei).to eq 50.0
		end
	end

	# Debe existir la candidad de terreno utilizado en m2a˜no.
	context "after simple .new" do
		it "should exist the amount of ground (in m^2ano)" do
			comida = Alimento.new("name1", 50.0, 164.0)
			expect(comida.terreno).to eq 164.0
		end
	end

	# Existe un m´etodo para obtener el nombre del alimento.
	context "for the class Alimento" do
		it "should exist a method to get the name" do
			expect(Alimento.method_defined? :get_name).to eq true
		end
	end

	# Existe un m´etodo para obtener las emisiones de gases de efecto invernadero.
	context "for the class Alimento" do
		it "should exist a method to get the gei" do
			expect(Alimento.method_defined? :get_gei).to eq true
		end
	end
end


# Existe un m´etodo para obtener el terreno utilizado.
# Existe un m´etodo para obtener el alimento formateado.
# Existe un m´etodo para obtener el valor energ´etico de un alimento.
# Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 a˜nos.
# Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 a˜nos.