# Create a Planet class which will represent a planet.
# Add an initialize method which takes several arguments and uses them to set the class' instance variables.
# Create a method that returns the Planet's attributes in an easy to read fashion.
# Create reader methods to give a user access to read the instance variables.
# Make your SolarSystem class take an array of Planets instead of hashes.

# Verify user input for integers
def verify(user_input)
  until user_input.to_i.to_s == user_input
    puts "Please enter a number: "
    user_input = gets.chomp
  end
  return user_input.to_i
end

# Verify user input for "Y" or "N"
def verify_y_n(user_input)
  until user_input == "Y" || user_input == "N"
    puts "Please enter Y or N: "
    user_input = gets.chomp.upcase
  end
  return user_input
end

class Planets

  attr_reader :name, :color, :shape, :motto, :planetary_bird, :year_length, :distance_from_the_sun

  def initialize(name, color, shape, motto, planetary_bird, year_length, distance_from_the_sun)

    @name = name
    @color = color
    @shape = shape
    @motto = motto
    @planetary_bird = planetary_bird
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun

  end

  def all_attributes
    list = ""
    list << "Name: #{@name}\nColor: #{@color}\nShape: #{@shape}\nMotto: #{@motto}\nPlantary bird: #{@planetary_bird}\nYear length: #{@year_length}\nDistance from the sun: #{@distance_from_the_sun}"
    return list
  end

end
# Create a SolarSystem class with an @planets instance variable

class SolarSystem

  # Create an initialize method which should take a collection of planet names
  # and store them in an @planets instance variable
  # Instead of Strings for planets, modify SolarSystem's initialize method to take
  # a list of hashes where each planet is sent as a hash with at least 5 attributes.
  def initialize(planets)
    @planets = planets
    @age = 1000  # Solar system age (in earth years) => 365,000 days
  end

  # Method to return just the planet names
  def list_planet_names
    planet_names = ""

    @planets.each_with_index do |planet, i|
      planet_names << "#{i+1}: #{planet.name}\n"
    end

    # Add Exit option
    planet_names << "#{@planets.length + 1}: Exit"

    return planet_names

  end

  # Create a method to add a planet to the list

  def add_planet(new_planet)
    @planets << new_planet
  end

  # Create a method which will return not print a list of the planets as a String
  def return_planets
    list = ""
    @planets.each_with_index do |planet, i|
      list << "--- #{i+1} ---\nName: #{planet.name}\nColor: #{planet.color}\nShape: #{planet.shape}\nMotto: #{planet.motto}\nPlanetary bird: #{planet.planetary_bird}\nYear length (in days): #{planet.year_length}\nDistance from the sun (in feet): #{planet.distance_from_the_sun}\n"
    end
    return list
  end

  def one_planet(user_planet)
    planet_details = ""
    @planets.each_with_index do |planet, i|
      if user_planet == planet.name
        planet_details << "---\nName: #{planet.name}\nColor: #{planet.color}\nShape: #{planet.shape}\nMotto: #{planet.motto}\nPlanetary bird: #{planet.planetary_bird}\nYear length (in days): #{planet.year_length}\nDistance from the sun (in feet): #{planet.distance_from_the_sun}\n---\n"
      end
    end

    return planet_details
  end

  # Ensure that the each planet has a @distance_from_the_sun attribute. Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
  def distance_btwn_planets(planet_1, planet_2)
    # STILL TO DO - Verify that the planets are different

    # find planet with larger distance
    # subtract smaller distance from larger distance
    # return result

    #  a <=> b
      # if a < b then return -1
      # if a = b then return  0
      # if a > b then return  1

    if (planet_1.distance_from_the_sun <=> planet_2.distance_from_the_sun) == 1
      distance = planet_1.distance_from_the_sun - planet_2.distance_from_the_sun
      return distance
    elsif (planet_1.distance_from_the_sun <=> planet_2.distance_from_the_sun) == -1
      distance = planet_2.distance_from_the_sun = planet_1.distance_from_the_sun
      return distance
    else # they are equal
      puts "You entered in the same planet twice! It's distance from itself is 0."
    end
  end

  # Define a method that returns the local year (earth years) of the planet based on it's rotation since the beginning of the solar system

  # earth = x * 365/365 (x = age of solar system)
  # jupiter = x * 500/365

  def earth_years
    earth_year_list = ""
    @planets.each_with_index do |planet, i|
      # earth_year_list << @age * (planet.year_length / 365)
        earth_year_list << "---\nName: #{planet.name}\nAge in earth years: #{@age * (planet.year_length / 365.0)}\n"
      end
    return earth_year_list
  end

end

# Create instances of planets
planet_1 = Planets.new("Winnicott", "Technicolour", "Heart", "You are good", "Cedar waxwing", 500, 2323232)
planet_2 = Planets.new("Rollo", "Black", "Round", "Deep breath", "Great blue heron", 23, 100)
planet_3 = Planets.new("Yalom", "Bright yellow", "Square", "Star at the sun", "Emperor penguin", 123, 10)
planet_4 = Planets.new("KENN", "Red", "Sphere", "Connections are everywhere", "American Robin", 945, 250)
planet_5 = Planets.new("Earth", "Multicolour", "Sphere", "???", "All birds", 365, 1000)

# Create instance of solar system using previous instances of planets
my_system = SolarSystem.new([planet_1, planet_2, planet_3, planet_4, planet_5])

# Write a program that asks for user input to query the planets:
# First, ask the user to select a planet they'd like to learn about.
# Present the user with a list of planets from which they can choose. Something like:
# 1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit
# Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
# Then ask the user for another planet.

puts "---"
puts "Welcome to this solar system! Here are the planets that live here: "

# Display planet list (list_planet_names method) without last line (i.e., Exit)
# str = str.strip.split("\n")
# last_line = str.pop
# str = str.join("\n")

array_list = my_system.list_planet_names.strip.split("\n")
array_list.pop
array_list = array_list.join("\n")

puts "#{array_list}"
puts "---"

puts "Would you like to learn about the planets (Y/N)?: "
user_answer = gets.chomp
user_answer = verify_y_n(user_answer)

if user_answer == "Y"
  # STILL TO DO => FIGURE OUT HOW TO FIND INFO IF USER INPUT A NUMBER
  puts "Please choose a planet you'd like to learn about (Please type in the full planet name, or type Exit if you don't want to learn right now): "
  # List planets minus Exit
  puts "---"
  puts my_system.list_planet_names

  choice = gets.chomp
  # STILL TO DO => VERIFY USER INPUT
  until choice == "Exit"
    # Find choice and print out info for selected planet
    planet_info = my_system.one_planet(choice)
    puts planet_info
    # Ask user if they want to learn more
    puts "Please choose another planet to learn about (or select Exit to stop learning): "
    puts my_system.list_planet_names
    choice = gets.chomp
  end

else # user_answer == "N"
end

# Ask user if they would now like to create their own planet
# Create a method, outside any class, which creates a planet from user input
puts "Would you like to add your own planet (Y/N)?: "
user_planet = gets.chomp.upcase
user_planet = verify_y_n(user_answer)

if user_planet == "Y"
  while true
    def create_user_planet
      puts "---"
      puts "Please add your own planet: "
      puts "What do you call your planet?: "
      name = gets.chomp
      # STILL TO DO => VERIFY USER INPUT
      puts "What color is your planet?: "
      color = gets.chomp
      puts "What shape is your planet?: "
      shape = gets.chomp
      puts "What's your planet's motto?: "
      motto = gets.chomp
      puts "What's your planetary bird?: "
      bird = gets.chomp
      puts "What's the year length on your planet in days (please enter number value only)?: "
      year_length = gets.chomp
      year_length = verify(year_length)
      puts "And lastly, what's your planet's distance from the sun in feet (please enter number value only)?: "
      distance_from_the_sun = gets.chomp
      distance_from_the_sun = verify(distance_from_the_sun)

      user_planet = Planets.new(name, color, shape, motto, bird, year_length, distance_from_the_sun)

      puts "--- Your planet ---\n#{user_planet.all_attributes}"

      return user_planet
      # STILL TO DO - allow user to add planets until done
    end
    my_system.add_planet(create_user_planet)
    puts "--- Planet list ---"
    puts my_system.return_planets
    puts "---"

    puts "Would you like to create another planet (Y/N)?: "
    another_planet = gets.chomp.upcase
    another_planet = verify_y_n(another_planet)

    if another_planet == "Y"
    else #another_planet == "N"
      break #break out of while loop and program
    end
  end

  else # user_planet == "N"

end

distance = my_system.distance_btwn_planets(planet_1, planet_2)
puts "---"
puts "Fun fact: The distance between #{planet_1.name} and #{planet_2.name} is: #{distance} feet."

earth_years = my_system.earth_years
puts "---"
puts "More fun facts. The ages of the planets in earth years are: "
puts earth_years
