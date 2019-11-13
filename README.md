Nombre: Pier Paolo Tarasco
Asignatura: Lenguajes y Paradigmas de programacion
Fecha: 14 de noviembre de 2019
Pratica 6


Para installar las dependencies ejecutar este comando:
$ bundle install

Por cada uno Alimento tenemos:
1. un nombre
2. cantitad de Proteinas (g)
3. cantitad de Carbohidratos (g)
4. cantitad de Lipidos (g)
5. media de kilogramos de emisiones de gases
	de efecto invernadero por porcion, o GEI, en
	kgCO2eq
6. Metros cuadrados por ano del uso de terreno en m^2ano

El valor energetico de un alimento se misura, normalmente, en kilocalories y para facilitar los calulos del valor energetico de los alimentos se toman unos valores estandar para cada grupo:
- 1g de glucidos obtiene 4kcal
- 1g de lipidos  obtiene 9kcal
- 1g de proteineas consigue 4kcal

Segun las tablas de ingestas recomendadas para la poblacion espanola de 20-39 anos diariamente
los hombres deben consumir 3.000 kcal de energia, de los cuales 54 gramos deben provenir de proteınas.
En el caso de las mujeres la energia a consumir es 2.300 kcal, y 41 gramos de proteınas.

Se calcula el impacto ambiental diario de un alimento en base a la cantidad diaria recomendada.
El impacto ambiental es igual a la media aritmetica de I huella material, I huella carbono, I huella hidrica y I uso terreno

Entonces tenemos que haber para cada alimento tambien la cuantitad de 
- material (g), carbono (g), hidrica (L), terreno (m^2)

Por cada uno de los indicatores puede haber un valor
Bajo, Regular o Alto definito como sigue:

def indicator_material()
	if @material < 2670
		return Bajo
	elsif @material <= 4000
		return Regular
	else
		return Alto
	end
end

def indicator_carbono()
	if @carbono < 800
		return Bajo
	elsif @carbono <= 1200
		return Regular
	else
		return Alto
	end
end

def indicator_hidrica()
	if @hidrica < 640
		return Bajo
	elsif @hidrica <= 975
		return Regular
	else
		return Alto
	end
end

def indicator_terreno()
	if @terreno < 1.25
		return Bajo
	elsif @terreno <= 1.875
		return Regular
	else
		return Alto
	end
end

Y Al final la huella_nutricional_ambiental es igual a
(indicator_material() + indicator_carbono() + indicator_hidrica() + indicator_terreno()) / 4