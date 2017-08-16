# Planets in the solar system array
planets_list = [
  {"Name:" => "Mercury", "Size:" => "Smallest", "Color:" => "Red", "Type:" => "Rock", "Moons:" => 1},
  {"Name:" => "Venus", "Size:" => "Smaller", "Color:" => "Yellow", "Type:" => "Gas", "Moons:" => 2},
  {"Name:" => "Earth", "Size:" => "Smallest", "Color:" => "Blue", "Type:" => "Water", "Moons:" => 1},
  {"Name:" => "Mars", "Size:" => "Medium", "Color:" => "Dark Red", "Type:" => "Dead Rock", "Moons:" => 3},
  {"Name:" => "Jupiter", "Size:" => "Largest", "Color:" => "Green", "Type:" => "Gas", "Moons:" => 9},
  {"Name:" => "Hoth", "Size:" => "Large", "Color:" => "idk", "Type:" => "Moon", "Moons:" => 0}
]

# Create solar system class
class Solar_System
  # All planet names should be stored into an instance variable
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end
  # METHOD FOR RETURNING THE ENTIRE PLANET LIST AS A STRING
  def add_planet(new_planet)
    @planets << new_planet
  end
  def print_planet_list
    # String must be an empty string
    current_att = ""
    @planets.each_with_index do |planet, index|
      planet.each do |att, value|
        current_att += "#{att}\t#{value}\n"
      end
      # After I get to end of a single planet add a new line before the next planet iteration
      current_att += "\n"
    end
    return current_att # Cannot return the variable with all attributes until you loop over each iteration
  end
end

# CREATE NEW HASH WITH ALL ATTRIBUTES
new_planet = {"Name:" => "Neptune", "Size:" => "Grandest", "Color:" => "Blue Green", "Type:" => "Gas", "Moons:" => 4}
two_planet = {"Name:" => "Pluto", "Size:" => "Extra Tiny", "Color:" => "Black", "Type:" => "Icey", "Moons:" => "It is a moon"}


my_solar_system = Solar_System.new(planets_list)
# PASS IN NEW HASH TO THE EXISTING HASH
my_solar_system.add_planet(new_planet)
my_solar_system.add_planet(two_planet)
# Call print method on solar system
puts my_solar_system.print_planet_list
