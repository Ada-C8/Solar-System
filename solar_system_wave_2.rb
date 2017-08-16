# Create solar system class
class SolarSystem
  # All planet names should be stored into an instance variable
  attr_reader :planets

  def initialize(planets)
    @planets = planets
  end
  # METHOD FOR RETURNING THE ENTIRE PLANET LIST AS A STRING
  def add_planet(new_planet)
    @planets << new_planet
  end
  def print_planet_list
    # Iterate over each index in array and call the return_att Planet method
    current_planet = ""
    @planets.each do |planet|
      current_planet += planet.return_att + "\n"
    end
    return current_planet
  end
end
# Create a Planet class which will represent a planet.
class Planet
  attr_accessor :name, :size, :colour

  def initialize(name, size, colour)
    @name = name
    @size = size
    @colour = colour
  end
  # Create a method that returns the Planet's attributes in an easy to read fashion.
  def return_att
    return "Name:\t#{@name}\nSize:\t#{@size}\nColour:\t#{@colour}\n"
  end
end
# Create your new planets as new instances of the Planet Class
pluto = Planet.new("Pluto","Very Tiny", "Black")
earth = Planet.new("Earth","Average", "Blue and Green")
moon = Planet.new("Moon", "Smaller than pluto", "Rock")
# Set into array
all_planets = [pluto, earth]
# Create a new instance of solar system and pass in the all_planets array
new_solar_system = SolarSystem.new(all_planets)
# Call on the print in the Planet class method. This works because this method loops over each planet and then calls on return_att method in the PLANET class
puts new_solar_system.print_planet_list

# Method to add the new planet moon to the solar system
new_solar_system.add_planet(moon)
# Check to see if new planet was added
puts new_solar_system.print_planet_list
