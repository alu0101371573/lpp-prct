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