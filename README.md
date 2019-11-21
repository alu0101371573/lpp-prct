Nombre: Pier Paolo Tarasco
Asignatura: Lenguajes y Paradigmas de programacion
Fecha: 21 de noviembre de 2019
Pratica 7


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prct06-bundler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prct06-bundler

## Usage

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

Se calcula los differentes impacto environmental para comer 5 differentes dietas con un rapporto differentes
de carbohydrates, lipidos y proteınas.
Se ha buscado que el impacto mayor es cuando se come mas carne que comida "naturales" como nuez o verdura. Entonces una dieta espanola es buena porque tiene solo un 20% de proteinas y esto permite de comer meno carne que otra dietas.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).