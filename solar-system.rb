class Planet
  # attr_accessor
  attr_reader :name, :diameter, :year_length, :distance_from_the_sun, :number_of_moons, :attributes

  def initialize(name, diameter, year_length, distance_from_the_sun, number_of_moons)
    @name = name
    @diameter = diameter #in miles
    @year_length = year_length #in Earth days
    @distance_from_the_sun = distance_from_the_sun #in Astrological Units
    @number_of_moons = number_of_moons

  end

  # Prints all the info of a given planet
  def print_all_info
    return "#{@name}\n" +
    " - #{@name} has a diameter of #{@diameter} miles.\n" +
    " - #{@name} has a year length of #{year_length} Earth days.\n" +
    " - #{@name} is #{@distance_from_the_sun} Astrological Units away from the sun.\n" +
    " - #{@name} has #{@number_of_moons} number of moons.\n\n"
  end

  # Takes in another Planet class and calculates the distance between them in Astrological Units
  def distance_from(planet)
    return "#{(@distance_from_the_sun - planet.distance_from_the_sun).abs}AU"
  end

end
# End of Planet Class #

class SolarSystem
  attr_reader :planets, :age

  def initialize(planets, age)
    @planets = planets
    @age = age
  end

  # Takes in a new Planet object and adds to this SolarSystem
  def add_planet(new_planet)
    @planets.push(new_planet)
  end

  # Returns the number of planets
  def num_planets
    return @planets.length
  end

  # Returns a String of all the planets in enumerated form
  def list_planets
    string = ""
    @planets.length.times do |planet_index|
      string += "#{planet_index + 1}.  #{@planets[planet_index].name}\n"
    end
    return string
  end

  # Give an index for a planet in the solar system and return it's local year compared to solar system
  def planet_local_year(index)
    return @age / @planets[index].year_length
  end

end
# End of SolarSystem class #

# Methods Outside The Defined Classes

# Takes in a number and returns back the same number only when user gives a valid number
# Or else they're prompted to type in a valid number
def force_valid_num(num)
  until num == num.to_f.to_s || num == num.to_i.to_s
    print "That is not a number. Please enter a valid number: "
    num = gets.chomp
  end
  return num
end

# Interface for user to find out more about each planet with a numbered selection
def planet_observatory_interface(solar_system)
  puts "\nWelcome to the Planet Observatory!"
  puts "Please select a number to find out more about a planet!"
  puts solar_system.list_planets
  puts "#{solar_system.planets.length + 1}.  Exit"

  print "Enter number of choice: "
  user_choice = gets.chomp.to_i

  # Until the user picks "Exit"'s number
  until user_choice == solar_system.planets.length + 1
    # If user picks a valid number
    if(user_choice >= 1 && user_choice <= solar_system.planets.length)
      puts solar_system.planets[user_choice - 1].print_all_info
      puts "\nWould you like to learn more about the other planets? "
      print "Please enter another number of your choice: "
    else
      print "\nThat's an invalid value. Please enter a number between 1 and #{solar_system.planets.length + 1}: "
    end
    user_choice = gets.chomp.to_i
  end
  puts "Thanks for using the Planet Observatory!"
  puts "\n==============\n\n"
end

# Takes in a solar system and adds a planet to it using an interface
def create_planet_interface(solar_system)
  puts "Create a new planet!"
  print "  What's the name of the planet? "
  new_name = gets.chomp
  print "  What's the diameter (in miles)? "
  new_diameter = force_valid_num(gets.chomp).to_f
  print "  How many Earth days does it take for it to go around the sun? "
  new_year_length = force_valid_num(gets.chomp).to_f
  print "  How far is it from the sun (in AU)? "
  new_distance = force_valid_num(gets.chomp).to_f
  print "  How many moons does it have? "
  new_num_moon = force_valid_num(gets.chomp).to_i

  new_planet = Planet.new(new_name, new_diameter, new_year_length, new_distance, new_num_moon)

  solar_system.add_planet(new_planet)
  puts "\nHere's the updated list with your new planet!\n"
  puts solar_system.list_planets
  puts "\n==============\n"
end

planet_array = [
  Planet.new(
    "Mercury",
    3032,
    87.97,
    0.39,
    0
  ),
  Planet.new(
    "Venus",
    7520.8,
    224.7,
    0.723,
    0
  ),
  Planet.new(
    "Earth",
    7917.5,
    365.26,
    1,
    1
  ),
  Planet.new(
    "Mars",
    4212,
    686.69,
    1.524,
    2
  ),
  Planet.new(
    "Jupiter",
    86881.4,
    4331.98,
    5.203,
    67
  ),
  Planet.new(
    "Saturn",
    72367.4,
    10760.56,
    9.539,
    62
  ),
  Planet.new(
    "Uranus",
    31518,
    30685.49,
    19.18,
    27
  ),
  Planet.new(
    "Neptune",
    30599,
    60191.2,
    30.06,
    13
  ),
]

our_solar_system = SolarSystem.new(planet_array, 4_600_000_000)
create_planet_interface(our_solar_system)
planet_observatory_interface(our_solar_system)

puts "Optional Enhancement: Distance From The Sun"
rand_index1 = rand(our_solar_system.planets.length)
rand_index2 = rand(our_solar_system.planets.length)
puts "The distance between #{our_solar_system.planets[rand_index1].name} and #{our_solar_system.planets[rand_index2].name} is..."
puts "#{our_solar_system.planets[rand_index1].distance_from(our_solar_system.planets[rand_index2])}\n"

puts "\nOptional Enhancement: Planet's Local Year Method"
puts "This solar system is #{our_solar_system.age} years old"
random_planet_index = rand(our_solar_system.planets.length)
puts "Relatively, #{our_solar_system.planets[random_planet_index].name}'s local year is:"
puts "#{'%.2f' % our_solar_system.planet_local_year(random_planet_index)}"



#Optional
# [X] - Ensure that the each planet has a @distance_from_the_sun attribute.
#      Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
# [X] - Give your solar system an age (in earth years).
# [X] - Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system
#      Just create a birth year.
#      Ex. solar system is 40 years old.
#      40 / year_length = current year of planet
