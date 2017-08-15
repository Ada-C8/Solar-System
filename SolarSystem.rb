require './SolarSystemMethods.rb'

# create planets by instantiating Planet
mercury = Planet.new("Mercury", 0.24,   0.39,  3032,    0.06,  0)
venus   = Planet.new("Venus",   0.62,   0.72,  7520.8,  0.82,  0)
earth   = Planet.new("Earth",   1,      1.00,  7917.5,  1.00,  1)
mars    = Planet.new("Mars",    1.88,   1.52,  4212,    0.11,  2)
jupiter = Planet.new("Jupiter", 11.78,  5.20,  86881.4, 317.8, 53)
saturn  = Planet.new("Saturn",  30.14,  9.54,  72367.4, 95.2,  53)
uranus  = Planet.new("Uranus",  1.01,   19.18, 31518,   14.6,  27)
neptune = Planet.new("Neptune", 164.93, 30.06, 30599,   17.2,  13)

# create an instance of SolarSystem with the array Planet.instances.
# use this version of the solar system is being created with all planets at all times (version below if not all planets being used)
# my_solar_system = SolarSystem.new(Planet.instances, 4_600_000_000_000)

# solar system made up of only some of the Planet instances
my_planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
my_solar_system = SolarSystem.new(my_planets, 4_600_000_000_000)

# test the .add method
pluto = Planet.new("Pluto", 247.95, 39.5, 1475, 0.002, 5)
my_solar_system.add(pluto)

# interact with the user
interact(my_solar_system)
