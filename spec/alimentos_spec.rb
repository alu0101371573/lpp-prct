load "Alimento.rb"

# name, gei, terreno, carb, protein, lipidos
carneVaca = Aliment.new("Carne de vaca", 50.0, 164.0, 0.0, 21.1, 3.1)

carneCordero = Aliment.new("Carne de cordero", 20.0, 185.0, 0.0, 18.0, 17.0)

camarones = Aliment.new("Camarones", 18.0, 2.0, 1.5, 17.6, 0.6)

chocolate = Aliment.new("Chocolate", 2.3, 3.4, 47.0, 5.3, 30.0)

salmon = Aliment.new("Salmon", 6.0, 3.7, 0.0, 19.9, 13.6)

cerdo = Aliment.new("Cerdo", 7.6, 11.0, 0.0, 21.5, 6.3)

pollo = Aliment.new("Pollo", 5.7, 7.1, 0.0, 20.6, 5.6)

queso = Aliment.new("Queso", 11.0, 41.0, 1.3, 25.0, 33.0)

cerveza = Aliment.new("Cerveza", 0.24, 0.22, 3.6, 0.5, 0.0)

leche = Aliment.new("Leche", 3.2, 8.9, 4.8, 3.3, 3.2)

huevos = Aliment.new("Huevos", 4.2, 5.7, 1.1, 13.0, 4.2)

cafe = Aliment.new("Cafe", 0.4, 0.3, 0.0, 0.1, 0.4)

tofu = Aliment.new("Tofu", 2.0, 2.2, 1.9, 8.0, 2.0)

lentejas = Aliment.new("Lentejas", 0.4, 3.4, 52.0, 23.5, 0.4)

nuez = Aliment.new("Nuez", 0.3, 7.9, 21.0, 20.0, 0.3)


RSpec.describe Alimento do
	# Debe existir un nombre para el alimento.
	context "after simple .new" do
		it "should return the name of the aliment" do
			comida = Alimento.new("name1", 50.0, 164.0, 0.0, 21.1, 3.1)
			expect(comida.name).to eq "name1"
		end
	end

	# Debe existir la candidad de emisi´on de gases de efecto invernadero en kgCO2eq.
	context "after simple .new" do
		it "should exist the amount of gas emissions (in kgCO2eq)" do
			comida = Alimento.new("name1", 50.0, 164.0, 0.0, 21.1, 3.1)
			expect(comida.gei).to eq 50.0
		end
	end

	# Debe existir la candidad de terreno utilizado en m2a˜no.
	context "after simple .new" do
		it "should exist the amount of ground (in m^2ano)" do
			comida = Alimento.new("name1", 50.0, 164.0, 0.0, 21.1, 3.1)
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

	# Existe un m´etodo para obtener el terreno utilizado.
	context "for the class Alimento" do
		it "should exist a method to get the ground" do
			expect(Alimento.method_defined? :get_ground).to eq true
		end
	end

	# Existe un m´etodo para obtener el alimento formateado.
	context "for the class Alimento" do
		it "should exist a method to get the alimento formateado" do
			expect(Alimento.method_defined? :get_info).to eq true
		end
	end

	# Existe un m´etodo para obtener el valor energ´etico de un alimento.
	context "for the class Alimento" do
		it "should exist a method to get the energia" do
			expect(Alimento.method_defined? :get_energia).to eq true
		end
	end
end


# Se calcula correctamente el impacto ambiental diario de un hombre de 20-39 a˜nos.
# Se calcula correctamente el impacto ambiental diario de una mujer de 20-39 a˜nos.