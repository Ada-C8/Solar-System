# Create a planet class that will represent a planet
class Planet

# Add an initialize method that takes several arguments and uses them to set the class instance variables.

  def initialize(planet, color, inhabitants, distance_from_sun, year_length, moons)
    @planet = planet
    @color = color
    @inhabitants = inhabitants
    @distance_from_sun = distance_from_sun
    @year_length = year_length
    @moons = moons
  end

# Create a method that returns the Planet's attributes in an easy to read fashion
  def attributes
    return "\nPlanet: #{@planet}, Color: #{@color}, Inhabitants: #{@inhabitants}, Distance from the sun: #{@distance_from_sun} million miles, Length in a year: #{@year_length} days, Moons: #{@moons}."
  end
end

# Create a SolarSystem class.
class SolarSystem

# Create an initialize method which takes a collection of planet names and stores them in an @planets instance variable.
  def initialize(data)
    @planets = []

    data.each do |item|
      add_planet(item)
    end
  end

  # Create a method to add a planet to the list.

  def add_planet(planet)
    @planets.push(Planet.new(planet[:planet], planet[:color], planet[:inhabitants], planet[:distance_from_sun], planet[:year_length], planet[:moons]))
  end

  # Create a method that will return and not print a list of the planets as strings.
  def planets
    ret = []
    @planets.each do |item|
      ret.push(item.attributes)
    end
    return ret
  end
end

# Instead of strings for planets, modify SolarSystem's initialize method to take a list of hashes where each planet is sent as a hash with at least 5 attributes.

data = [
  {planet: "Gallifrey",
     color: "Red",
     inhabitants: "Time Lords",
     distance_from_sun: 62,
     year_length: 652,
     moons: 4},

    {planet: "Adipose 3",
     color: "White",
     inhabitants: "Adipose",
     distance_from_sun: 84,
     year_length: 490,
     moons: 1},

    {planet: "Asgard",
     color: "Green",
     inhabitants: "Vashta Nerada",
     distance_from_sun: 95,
     year_length: 385,
     moons: 5},

    {planet: "Darillium",
     color: "Yellow",
     inhabitants: "Singing Towers",
     distance_from_sun: 76,
     year_length: 262,
     moons: 3},

    {planet: "Mira",
     color: "Brown",
     inhabitants: "Visians",
     distance_from_sun: 204,
     year_length: 416,
     moons: 2},

    {planet: "Necros",
     color: "Grey",
     inhabitants: "The Dead",
     distance_from_sun: 1000,
     year_length: 6841,
     moons: 9}
]

ss = SolarSystem.new(data)
puts ss.planets
