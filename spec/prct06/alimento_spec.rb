include Prct06::Bundler
# name, gei, terreno, carb, protein, lipidos
# carneVaca = Alimento.new("Carne de vaca", 50.0, 164.0, 0.0, 21.1, 3.1)

# carneCordero = Alimento.new("Carne de cordero", 20.0, 185.0, 0.0, 18.0, 17.0)

# camarones = Alimento.new("Camarones", 18.0, 2.0, 1.5, 17.6, 0.6)

# chocolate = Alimento.new("Chocolate", 2.3, 3.4, 47.0, 5.3, 30.0)

# salmon = Alimento.new("Salmon", 6.0, 3.7, 0.0, 19.9, 13.6)

# cerdo = Alimento.new("Cerdo", 7.6, 11.0, 0.0, 21.5, 6.3)

# pollo = Alimento.new("Pollo", 5.7, 7.1, 0.0, 20.6, 5.6)

# queso = Alimento.new("Queso", 11.0, 41.0, 1.3, 25.0, 33.0)

# cerveza = Alimento.new("Cerveza", 0.24, 0.22, 3.6, 0.5, 0.0)

# leche = Alimento.new("Leche", 3.2, 8.9, 4.8, 3.3, 3.2)

# huevos = Alimento.new("Huevos", 4.2, 5.7, 1.1, 13.0, 4.2)

# cafe = Alimento.new("Cafe", 0.4, 0.3, 0.0, 0.1, 0.4)

# tofu = Alimento.new("Tofu", 2.0, 2.2, 1.9, 8.0, 2.0)

# lentejas = Alimento.new("Lentejas", 0.4, 3.4, 52.0, 23.5, 0.4)

# nuez = Alimento.new("Nuez", 0.3, 7.9, 21.0, 20.0, 0.3)


RSpec.describe Alimento do
	context "after simple .new" do
		before(:each) do
	    	@comida = Alimento.new("name1", 1, 50.0, 164.0, 0.0, 21.1, 3.1)
	  	end

		it "should return the name of the aliment" do
			expect(@comida.name).to eq "name1"
		end

		it "should exist the amount of gas emissions (in kgCO2eq)" do
			expect(@comida.gei).to eq 5.0
		end

		it "should exist the amount of ground (in m^2ano)" do
			expect(@comida.terreno).to eq 164.0
		end
	end

	context "for the class Alimento" do
		it "should exist a method to get the name" do
			expect(Alimento.method_defined? :name).to eq true
		end

		it "should exist a method to get the gei" do
			expect(Alimento.method_defined? :gei).to eq true
		end

		it "should exist a method to get the ground" do
			expect(Alimento.method_defined? :terreno).to eq true
		end

		it "should exist a method to get the alimento formateado" do
			expect(Alimento.method_defined? :get_info).to eq true
		end

		it "should exist a method to get the energia" do
			expect(Alimento.method_defined? :get_energia).to eq true
		end
	end

	context "Calculating the daily environmental impact" do
		it "for a man aged 20-39 years old" do
			# 3000kcal with at least 54g of proteins.
			pollo = Alimento.new("Pollo 200g", 2, 5.7, 7.1, 0.0, 20.6, 5.6)
			carneCordero = Alimento.new("Carne de cordero 200g", 2, 20.0, 185.0, 0.0, 18.0, 17.0)
			chocolate = Alimento.new("Chocolate 200g", 2, 2.3, 3.4, 47.0, 5.3, 30.0)
			queso = Alimento.new("Queso 300g", 3, 11.0, 41.0, 1.3, 25.0, 33.0)
			nuez = Alimento.new("Nuez 300g", 3, 0.3, 7.9, 21.0, 20.0, 0.3)

			expect(pollo.get_energia + chocolate.get_energia + queso.get_energia + carneCordero.get_energia + nuez.get_energia).to be >= 3000
			expect(pollo.proteins + chocolate.proteins + queso.proteins + carneCordero.proteins + nuez.proteins).to be >= 54
			expect(pollo.gei + carneCordero.gei + chocolate.gei + queso.gei + nuez.gei).to eq 21.37
		end

		# 2300kcal with at least 41g of proteins.
		it "for a woman aged 20-39 years old" do
			# 3000kcal with at least 54g of proteins.
			pollo = Alimento.new("Pollo 200g", 2, 5.7, 7.1, 0.0, 20.6, 5.6)
			carneCordero = Alimento.new("Carne de cordero 200g", 2, 20.0, 185.0, 0.0, 18.0, 17.0)
			chocolate = Alimento.new("Chocolate 200g", 2, 2.3, 3.4, 47.0, 5.3, 30.0)
			queso = Alimento.new("Queso 300g", 3, 11.0, 41.0, 1.3, 25.0, 33.0)
			nuez = Alimento.new("Nuez 300g", 1, 0.3, 7.9, 21.0, 20.0, 0.3)

			expect(pollo.get_energia + chocolate.get_energia + queso.get_energia + carneCordero.get_energia + nuez.get_energia).to be >= 2300
			expect(pollo.proteins + chocolate.proteins + queso.proteins + carneCordero.proteins + nuez.proteins).to be >= 41
			expect(pollo.gei + carneCordero.gei + chocolate.gei + queso.gei + nuez.gei).to eq 21.130000000000003
		end
	end

end


