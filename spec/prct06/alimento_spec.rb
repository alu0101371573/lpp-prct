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

		it "should be comparable" do
			expect(@comida == @comida).to eq true
			@nuez = Alimento.new("Nuez", 1, 0.3, 7.9, 21.0, 20.0, 0.3)
			expect(@comida == @nuez).to eq false
		end
	end

	context "compare two aliments" do
		before(:each) do
			@chocolate = Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0)
			@salmon = Alimento.new("Salmon", 1, 6.0, 3.7, 0.0, 19.9, 13.6)
		end

		it "chocolate energy should be greater than salmon" do
			expect(@chocolate.get_energia > @salmon.get_energia).to eq true
		end

		it "chocolate geiPerKg should be less than salmon" do
			expect(@chocolate.gei() < @salmon.gei()).to eq true
		end

		it "chocolate terreno should be less than or equal to salmon" do
			expect(@chocolate.terreno() <= @salmon.terreno()).to eq true
		end

		it "chocolate carbs should not be equal to salmon" do
			expect(@chocolate.carbs() == @salmon.carbs()).to eq false
		end

		it "salmon proteins should  be equal or greater than  salmon" do
			expect(@salmon.proteins() >= @chocolate.proteins()).to eq true
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

	context "with list of aliment" do

		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 3, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 3, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 2, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 2, 7.6, 11.0, 0.0, 21.5, 6.3))
		end

		it "collect" do
			#puts "ciao"
			#puts @comidas.collect {|x| x.value == @comidas.head.value}
		end

		it "select" do

		end

		it "max" do

		end

		it "min" do

		end

		it "sort." do

		end

	end

	context "testing different diets" do

		it "Spanish Diet: should contains 40\% carbs, 20\% proteins and 40\% fat" do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 3, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 3, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 2, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 2, 7.6, 11.0, 0.0, 21.5, 6.3))

			dailyGei = 0.0
			dailyCarbsEnergy = 0.0
			dailyProteinsEnergy = 0.0
			dailyLipidsEnergy = 0.0
			totalDailyEnergy = 0.0
			terreno = 0.0

			comida = @comidas.head
			while comida != nil
				dailyGei += comida.value.gei
				dailyCarbsEnergy += comida.value.get_energia_carbs
				dailyProteinsEnergy += comida.value.get_energia_proteins
				dailyLipidsEnergy += comida.value.get_energia_lipidos
				totalDailyEnergy += comida.value.get_energia
				terreno += comida.value.terreno

				comida = comida.next
			end

			carbsPercent = dailyCarbsEnergy * 100 / totalDailyEnergy
			proteinsPercent = dailyProteinsEnergy * 100 / totalDailyEnergy
			lipidsPercent = dailyLipidsEnergy * 100 / totalDailyEnergy

			print "\tCarbs = ", carbsPercent.round(2), "\%; Proteins = ", proteinsPercent.round(2), "\%; Fat = ", lipidsPercent.round(2), "\%\n"

			expect(totalDailyEnergy).to be >= 2500
			expect(totalDailyEnergy).to be <= 3000
			puts "\tDaily GEI = " + dailyGei.round(2).to_s
			puts "\tYearly GEI = " + (dailyGei * 365).round(2).to_s
			puts "\tTerreno = " + terreno.round(2).to_s
		end

		it "Vasca Diet: should contains 60\% carbs, 15\% proteins and 25\% fat" do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 2, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 2, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 4, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 2, 7.6, 11.0, 0.0, 21.5, 6.3))
			@comidas.push(Alimento.new("Cerveza", 10, 0.24, 0.22, 3.6, 0.5, 0.0))

			dailyGei = 0.0
			dailyCarbsEnergy = 0.0
			dailyProteinsEnergy = 0.0
			dailyLipidsEnergy = 0.0
			totalDailyEnergy = 0.0
			terreno = 0.0

			comida = @comidas.head
			while comida != nil
				dailyGei += comida.value.gei
				dailyCarbsEnergy += comida.value.get_energia_carbs
				dailyProteinsEnergy += comida.value.get_energia_proteins
				dailyLipidsEnergy += comida.value.get_energia_lipidos
				totalDailyEnergy += comida.value.get_energia
				terreno += comida.value.terreno

				comida = comida.next
			end

			carbsPercent = dailyCarbsEnergy * 100 / totalDailyEnergy
			proteinsPercent = dailyProteinsEnergy * 100 / totalDailyEnergy
			lipidsPercent = dailyLipidsEnergy * 100 / totalDailyEnergy

			print "\tCarbs = ", carbsPercent.round(2), "\%; Proteins = ", proteinsPercent.round(2), "\%; Fat = ", lipidsPercent.round(2), "\%\n"

			expect(totalDailyEnergy).to be >= 2500
			expect(totalDailyEnergy).to be <= 3000
			puts "\tDaily GEI = " + dailyGei.round(2).to_s
			puts "\tYearly GEI = " + (dailyGei * 365).round(2).to_s
			puts "\tTerreno = " + terreno.round(2).to_s
		end


		it "Vegetarian Spanish Diet: should contains 40\% carbs, 20\% proteins and 40\% fat" do
			@comidas = List.new

			@comidas.push(Alimento.new("Chocolate", 3, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 2, 0.4, 3.4, 52.0, 23.5, 0.4))

			@comidas.push(Alimento.new("Leche", 5, 3.2, 8.9, 4.8, 3.3, 3.2))

			@comidas.push(Alimento.new("Huevos", 2, 4.2, 5.7, 1.1, 13.0, 4.2))

			dailyGei = 0.0
			dailyCarbsEnergy = 0.0
			dailyProteinsEnergy = 0.0
			dailyLipidsEnergy = 0.0
			totalDailyEnergy = 0.0
			terreno = 0.0

			comida = @comidas.head
			while comida != nil
				dailyGei += comida.value.gei
				dailyCarbsEnergy += comida.value.get_energia_carbs
				dailyProteinsEnergy += comida.value.get_energia_proteins
				dailyLipidsEnergy += comida.value.get_energia_lipidos
				totalDailyEnergy += comida.value.get_energia
				terreno += comida.value.terreno

				comida = comida.next
			end

			carbsPercent = dailyCarbsEnergy * 100 / totalDailyEnergy
			proteinsPercent = dailyProteinsEnergy * 100 / totalDailyEnergy
			lipidsPercent = dailyLipidsEnergy * 100 / totalDailyEnergy

			print "\tCarbs = ", carbsPercent.round(2), "\%; Proteins = ", proteinsPercent.round(2), "\%; Fat = ", lipidsPercent.round(2), "\%\n"

			expect(totalDailyEnergy).to be >= 2500
			expect(totalDailyEnergy).to be <= 3000
			puts "\tDaily GEI = " + dailyGei.round(2).to_s
			puts "\tYearly GEI = " + (dailyGei * 365).round(2).to_s
			puts "\tTerreno = " + terreno.round(2).to_s
		end

		it "Vegan Spanish Diet: should contains 40\% carbs, 20\% proteins and 40\% fat" do
			@comidas = List.new

			
			@comidas.push(Alimento.new("Lentejas", 4, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Tofu", 10, 2.0, 2.2, 1.9, 8.0, 2.0))
			@comidas.push(Alimento.new("Nuez", 5, 0.3, 7.9, 21.0, 20.0, 0.3))

			dailyGei = 0.0
			dailyCarbsEnergy = 0.0
			dailyProteinsEnergy = 0.0
			dailyLipidsEnergy = 0.0
			totalDailyEnergy = 0.0
			terreno = 0.0

			comida = @comidas.head
			while comida != nil
				dailyGei += comida.value.gei
				dailyCarbsEnergy += comida.value.get_energia_carbs
				dailyProteinsEnergy += comida.value.get_energia_proteins
				dailyLipidsEnergy += comida.value.get_energia_lipidos
				totalDailyEnergy += comida.value.get_energia
				terreno += comida.value.terreno

				comida = comida.next
			end

			carbsPercent = dailyCarbsEnergy * 100 / totalDailyEnergy
			proteinsPercent = dailyProteinsEnergy * 100 / totalDailyEnergy
			lipidsPercent = dailyLipidsEnergy * 100 / totalDailyEnergy

			print "\tCarbs = ", carbsPercent.round(2), "\%; Proteins = ", proteinsPercent.round(2), "\%; Fat = ", lipidsPercent.round(2), "\%\n"

			expect(totalDailyEnergy).to be >= 2500
			expect(totalDailyEnergy).to be <= 3000
			puts "\tDaily GEI = " + dailyGei.round(2).to_s
			puts "\tYearly GEI = " + (dailyGei * 365).round(2).to_s
			puts "\tTerreno = " + terreno.round(2).to_s
		end

		it "locura por la carne Diet: 50\% meat, should contains 40\% carbs, 20\% proteins and 40\% fat" do
			@comidas = List.new

			@comidas.push(Alimento.new("Carne de vaca", 5, 50.0, 164.0, 0.0, 21.1, 3.1))
			@comidas.push(Alimento.new("Chocolate", 3, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 2, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 2, 7.6, 11.0, 0.0, 21.5, 6.3))

			dailyGei = 0.0
			dailyCarbsEnergy = 0.0
			dailyProteinsEnergy = 0.0
			dailyLipidsEnergy = 0.0
			totalDailyEnergy = 0.0
			terreno = 0.0

			comida = @comidas.head
			while comida != nil
				dailyGei += comida.value.gei
				dailyCarbsEnergy += comida.value.get_energia_carbs
				dailyProteinsEnergy += comida.value.get_energia_proteins
				dailyLipidsEnergy += comida.value.get_energia_lipidos
				totalDailyEnergy += comida.value.get_energia
				terreno += comida.value.terreno

				comida = comida.next
			end

			carbsPercent = dailyCarbsEnergy * 100 / totalDailyEnergy
			proteinsPercent = dailyProteinsEnergy * 100 / totalDailyEnergy
			lipidsPercent = dailyLipidsEnergy * 100 / totalDailyEnergy

			print "\tCarbs = ", carbsPercent.round(2), "\%; Proteins = ", proteinsPercent.round(2), "\%; Fat = ", lipidsPercent.round(2), "\%\n"

			expect(totalDailyEnergy).to be >= 2500
			expect(totalDailyEnergy).to be <= 3000
			puts "\tDaily GEI = " + dailyGei.round(2).to_s
			puts "\tYearly GEI = " + (dailyGei * 365).round(2).to_s
			puts "\tTerreno = " + terreno.round(2).to_s
		end
	end

end


