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
			@pollo = Alimento.new("Pollo", 5, 5.7, 7.1, 0.0, 20.6, 5.6)
			@comidas.push(@pollo)
			@comidas.push(Alimento.new("Chocolate", 10, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 3, 7.6, 11.0, 0.0, 21.5, 6.3))
		end

		it "collect" do
			puts @comidas.collect { |c| c.name + "!" }
		end

		it "select" do
			expect((@comidas.select { |c| c.name == "Pollo" })[0]).to eq @pollo
		end

		it "max" do
			expect(@comidas.max.name).to eq "Chocolate"
		end

		it "min" do
			expect(@comidas.min.name).to eq "Lentejas"
		end

		it "sort." do
			expect(@comidas.sort).to eq [
				Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4),
				Alimento.new("Cerdo", 3, 7.6, 11.0, 0.0, 21.5, 6.3),
				Alimento.new("Pollo", 5, 5.7, 7.1, 0.0, 20.6, 5.6),
				Alimento.new("Chocolate", 10, 2.3, 3.4, 47.0, 5.3, 30.0)
			]
		end

	end

	context "with a dish (list of aliment)" do
		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 1, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))
		
			@grams = List.new

			@grams.push(300)	
			@grams.push(300)
			@grams.push(200)
			@grams.push(200)

			@plato = Plato.new("Spanish diet", @comidas, @grams)
		end

		it "should have a name" do
			expect(@plato.plateName).to eq("Spanish diet")
		end

		it "should have a list of food" do
			expect(@plato.alimentsList.class).to eq (List)
		end

		it "should have a list of grams" do
			expect(@plato.gramsList.class).to eq (List)
		end

		it "should have a around 20\% of proteins" do
			puts @plato.proteinsPercent
		end

		it "should have a around 40\% of carbs" do
			puts @plato.carbsPercent
		end

		it "should have a around 40\% of fat" do
			puts @plato.lipidsPercent
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

RSpec.describe PlatoExtended do
	context "with a dish" do
		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 1, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))
		
			@grams = List.new

			@grams.push(300)	
			@grams.push(300)
			@grams.push(200)
			@grams.push(200)

			@plato = PlatoExtended.new("Spanish diet", @comidas, @grams)
		end

		it "should have PlatoExtended class" do
			expect(@plato.class == PlatoExtended).to eq true
		end

		it "should be a subclass of Plato" do
			expect(@plato.class < Plato).to eq true
		end

		it "should return total co2" do
			puts @plato.totalGei()
		end

		it "should return total ground" do
			puts @plato.totalTerreno()
		end

		it "should return energy informations" do
			puts @plato.energyEfficiency()
		end
	end

	context "with a menu" do
		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 1, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))
		
			@grams = List.new

			@grams.push(300)	
			@grams.push(300)
			@grams.push(200)
			@grams.push(200)

			@plato1 = PlatoExtended.new("spanish menu", @comidas, @grams)

			#plate 2
			@comidas2 = List.new

			@comidas2.push(Alimento.new("Carne de vaca", 1, 50.0, 164.0, 0.0, 21.1, 3.1))
			@comidas2.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas2.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas2.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))

			@grams2 = List.new

			@grams2.push(500)	
			@grams2.push(300)
			@grams2.push(200)
			@grams2.push(200)

			@plato2 = PlatoExtended.new("Only meat dish", @comidas2, @grams2)

			@menu = List.new
			@prices = List.new

			@menu.push(@plato1)
			@prices.push(20.3)

			@menu.push(@plato2)
			@prices.push(35)
		end

		it "should have the nutricional indicator for each of the plates" do
			expect(@menu.get_at(0).value.nutricional_indicator()).to eq 1.5
		end

		it "should have the nutricional indicator for the menu" do
			puts @menu.each { |p| puts p.nutricional_indicator() }
		end

		it "should return the plate with maximum nutricional indicator" do
			max = @menu.max { |p1, p2| p1.nutricional_indicator() <=> p2.nutricional_indicator() }
			expect(max.to_s).to eq "spanish menu"
		end

		it "increments the prices of the dishes in proportions of the plate with maximum nutricional indicator" do
			max = @menu.max { |p1, p2| p1.nutricional_indicator() <=> p2.nutricional_indicator() }
			puts "Before: ", @prices
			@prices.each_with_index.map { |price, index| @prices.get_at(index).value = price * max.nutricional_indicator() / @menu.get_at(index).value.nutricional_indicator() }
			puts "After: ", @prices
		end
	end

	context "with two dish (Spanish and Locura)" do
		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 1, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))
		
			@grams = List.new

			@grams.push(300)	
			@grams.push(300)
			@grams.push(200)
			@grams.push(200)

			@plato1 = PlatoExtended.new("Spanish diet", @comidas, @grams)
		

			@comidas = List.new

			@comidas.push(Alimento.new("Carne de vaca", 1, 50.0, 164.0, 0.0, 21.1, 3.1))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))

			@grams = List.new

			@grams.push(500)	
			@grams.push(300)
			@grams.push(200)
			@grams.push(200)

			@plato2 = PlatoExtended.new("Locura por la carne diet", @comidas, @grams)
		end

		it "should be comarable" do
			expect(@plato1 < @plato2).to eq true
		end
	end

	context "with two dish (Vasca and Vegetariana)" do
		before(:each) do
			@comidas = List.new

			@comidas.push(Alimento.new("Pollo", 1, 5.7, 7.1, 0.0, 20.6, 5.6))
			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))
			@comidas.push(Alimento.new("Cerdo", 1, 7.6, 11.0, 0.0, 21.5, 6.3))
			@comidas.push(Alimento.new("Cerveza", 1, 0.24, 0.22, 3.6, 0.5, 0.0))
		
			@grams = List.new

			@grams.push(200)	
			@grams.push(200)
			@grams.push(400)
			@grams.push(200)
			@grams.push(1000)

			@plato1 = PlatoExtended.new("Vasca diet Dish", @comidas, @grams)
		

			@comidas = List.new

			@comidas.push(Alimento.new("Chocolate", 1, 2.3, 3.4, 47.0, 5.3, 30.0))
			@comidas.push(Alimento.new("Lentejas", 1, 0.4, 3.4, 52.0, 23.5, 0.4))

			@comidas.push(Alimento.new("Leche", 1, 3.2, 8.9, 4.8, 3.3, 3.2))

			@comidas.push(Alimento.new("Huevos", 1, 4.2, 5.7, 1.1, 13.0, 4.2))

			@grams = List.new

			@grams.push(300)	
			@grams.push(200)
			@grams.push(500)
			@grams.push(200)

			@plato2 = PlatoExtended.new("Locura por la carne diet", @comidas, @grams)
		end

		it "should be comarable" do
			expect(@plato1 > @plato2).to eq true
		end
	end
end
