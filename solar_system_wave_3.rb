class SolarSystem
  attr_reader :planets
  # All planet names should be stored into an instance variable
  def initialize(planets) # ARRAY OF OBJECTS
    @planets = planets
    return
  end
  # Have the user create a new planet in the Solar System!
  def create_planet
    puts "Name?"
    user_planet_name = gets.chomp
    puts "Size?"
    user_planet_size = gets.chomp
    puts "Color?"
    user_planet_color = gets.chomp
    puts "Type?"
    user_planet_type = gets.chomp
    puts "How many moons?"
    user_planet_moons = gets.chomp
    # Create a new object if the user wants to create a new planet
    return Planet.new(user_planet_name, user_planet_size, user_planet_color, user_planet_type, user_planet_moons)
  end
  # Add a new planet to the solar system!
  def add_planet(new_planet)
    @planets << new_planet
  end
  # Print single planet attributes
  def print_planet_att(planet_choice)
    # Iterate over each index in array and call the return_att Planet method
    attributes = ""
    @planets.each do |planet|
      if planet.name == planet_choice
        attributes = planet.return_att
      # attributes += planet.return_att + "\n"
      end
    end
    return attributes # Return all planet attributes as a long string
  end
  # Display all planets in your solar system to give the user choices
  def display_planet_options
    planet_names = ""
    @planets.each do |planet|
      planet_names += planet.name + "\n"
    end
    return planet_names # Return all planet names as a string
  end
  # Will print all planets!
  def print_all_planet_facts
    @planets.each do |planet|
      puts "Name:\t#{planet.name}\nSize:\t#{planet.size}\nColour:\t#{planet.colour}\nType:\t#{planet.type}\nNumber of Moons: #{planet.moons}"
      puts
    end
  end
end

# Create a Planet class which will represent a planet.
class Planet
  attr_accessor :name, :size, :colour, :type, :moons

  def initialize(name, size, colour, type, moons)
    @name = name
    @size = size
    @colour = colour
    @type = type
    @moons = moons
  end
  # Create a method that returns the Planet's attributes in an easy to read fashion.
  def return_att
    return "Size:\t#{@size}\nColour:\t#{@colour}\nType:\t#{@type}\nNumber of Moons: #{@moons}"
  end
end

# Create your new planets as new instances of the Planet Class
earth = Planet.new("Earth","Average", "Blue and Green", "Water Planet", "1")
moon = Planet.new("Moon", "Smaller than pluto", "Grey", "Moon Planet", "0")
pluto = Planet.new("Pluto","Very Tiny", "Black", "Icey Planet", "It is a moon!")

# Set into array
all_planets = [earth, moon, pluto]
# Create a new instance of solar system and pass in the all_planets array
solar_system = SolarSystem.new(all_planets)

puts "====See all the planets in the Solar System!===="
puts solar_system.display_planet_options

puts "\nWhich planet do you want to know more infomation about?"
planet_choice = gets.chomp.capitalize
# Loop until you get the one of these answers
until planet_choice == "Pluto" || planet_choice == "Earth" || planet_choice == "Moon"
  puts "Please input a valid planet"
  planet_choice = gets.chomp.capitalize
end
# Call print planet attributes method to based on the users choice by passing in the choice
puts solar_system.print_planet_att(planet_choice)

# Ask user if they want to add their own planet!
puts "\nWant to add a planet to the Solar System? Y or N"

user_input = gets.chomp.upcase
# Condtional to determine if user wants to make a planet
if user_input == "Y"
  # Call create_planet method in the SolarSystem
  planet_now_made = solar_system.create_planet
  # Use Add Planet Method from the SolarSystem
  solar_system.add_planet(planet_now_made)

  puts "=== Summary of Your Solar System ==="
  puts
  # Print all planets Method
  solar_system.print_all_planet_facts
else
  puts "Come back to the Solar System again!"
end
