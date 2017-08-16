
class SolarSystem

  attr_accessor :planets, :age

  attr_reader :size

  def initialize(planets, age)
    # planets is an array of planet objects
    @planets = planets
    @age = age
    @size = planets.length
  end

  def add_planet(new_planet)
    @planets << new_planet
    @size += 1
  end

  def return_planet_list
    # returns string representation of the solar system
    s = ""

    (0...@planets.length).each do |num|
      s += "#{num + 1}. #{@planets[num].name}\n"
    end
    return s
  end

  # method that returns a planet object given the planet's name as a string
  # returns nil if no such planet
  def get_planet(planet_name)
    @planets.each do |planet|
      if planet.name == planet_name
        selected_planet = planet
        return selected_planet
      end
    end

    return nil
  end

  def get_info(planet)
    return planet.return_info_par(@age)
  end

end # end of the SolarSystem class


class Planet

  attr_reader :name, :diameter, :mass, :num_moons, :distance_from_the_sun, :year_length

  def initialize(name, diameter, mass, num_moons, distance_from_the_sun, year_length)
    @name = name
    @diameter = diameter
    @mass = mass
    @num_moons = num_moons
    @distance_from_the_sun = distance_from_the_sun
    @year_length = year_length
  end

  def distance_from_planet(other_planet)
    return (other_planet.distance_from_the_sun - @distance_from_the_sun).abs
  end

  def local_year(solar_system_age)
    return (solar_system_age / (@year_length / 365.26)).to_i
  end

  def return_planet_info
    s = "Name: " + @name + "\n"
    s += "Diameter: " + @diameter.to_s + " km\n"
    s += "Mass: " + @mass.to_s + " kg\n"
    s += "Number of moons: " + @num_moons.to_s + "\n"
    s += "Distance from the sun: " + @distance_from_the_sun.to_s + " km\n"
    s += "Year length: " + @year_length.to_s + " days\n"

    return s
  end

  # returns planet info as a written par
  def return_info_par(solar_system_age)
    num_moons = get_num_moons(@num_moons)
    year_length = get_years(@year_length)

    par = "The planet #{@name} has #{num_moons}. It is #{@diameter} km in diameter, has a mass of #{@mass} kg, and is #{@distance_from_the_sun} km from the sun. One year on #{@name} is equal to #{year_length}. Given the age of the solar system--#{solar_system_age.to_i} years--the local year on #{@name} is #{local_year(solar_system_age)}."

    return par
  end

  private

  # returns num of moons as a string plus moon/moons as appropriate
  def get_num_moons(num_moons)
    if num_moons == 1
      return "1 moon"
    else
      return num_moons.to_s + " moons"
    end
  end

  # returns year length in days or years depending on whether it's > 1 earth year
  def get_years(year_length)
    if year_length > 365.26
      return (year_length / 365.26).round(2).to_s + " years"
    else
      return year_length.to_s + " days"
    end
  end

end # end of the Planet class


# user interface to view solar system
def intro(solar_system)
  intro = "Welcome to the solar system! The solar system is #{solar_system.age.to_int} years old and consists of #{solar_system.size} planets."

  return intro
end

# list all planets in solar system as a list to choose from
def main_menu
  puts "\n=== MAIN MENU ==="

  puts "1. Learn \n2. Make a planet \n3. Add a planet"

  puts "\nType number to select or 'exit' to quit"
end

def return_to_main_menu
  main_menu
  choice = gets.chomp.capitalize
  return choice
end

# returns a planet object based on user input
# input can be string representation of integer or planet name
# returns nil if no such planet found
def select_planet(solar_system, input)
  # check if user input a num and within range of list nums
  selected_planet = nil

  # assume char is a num; test for validity
  input_as_num = input.to_i

  # if num, retrieve planet by index
  if input_as_num > 0 && input_as_num <= solar_system.size
    selected_planet = solar_system.planets[input_as_num - 1]
  else
    selected_planet = solar_system.get_planet(input)
  end

  return selected_planet
end

def add_to_solar_system?
  puts "Add planet to solar system?"

  ans = gets.chomp.downcase

  case ans
  when "yes", "y"
    return true
  when "no", "n"
    return false
  else
      puts "Please choose yes or no"
      add_to_solar_system?
  end

end

# helper method that adds the planet to the solar system
def add_new_planet(solar_system, planet)
  solar_system.add_planet(planet)
  puts "Planet added!"
  puts "The solar system now has #{solar_system.size} planets"
end

# method that handles adding a planet as a menu option
def add_planet(solar_system)
  # get info from user
  new_planet = ask_for_info

  add_new_planet(solar_system, new_planet)

  # go back to main menu
  return return_to_main_menu

end

# prompts user for info to create a planet
def ask_for_info
  puts "Please provide the following information"

  print "\nPlanet name? "
  name = gets.chomp.capitalize

  print "Diameter (in km)? "
  diameter = gets.chomp.to_f

  print "Mass (in kg)? "
  mass = gets.chomp.to_f

  print "Number of moons? "
  num_moons = gets.chomp.to_i

  print "Distance from the sun (in km)? "
  distance_from_the_sun = gets.chomp.to_f

  print "Year length (in days)? "
  year_length = gets.chomp.to_f

  new_planet = Planet.new(name, diameter, mass, num_moons, distance_from_the_sun, year_length)

  return new_planet

end

# creates planet from user input
def create_planet(solar_system)
  puts "\nMAKE-A-PLANET"

  new_planet = ask_for_info

  puts "\nPlanet created!"
  puts "\n" + new_planet.return_planet_info

  if add_to_solar_system?
    add_new_planet(solar_system, new_planet)
  end

  return return_to_main_menu

end

# method that prompts user to learn about one of the planets
def learn(solar_system)
  puts "What planet would you like to learn about?"
  puts "\n"
  puts solar_system.return_planet_list
  puts "Type planet name or 'exit' to go back to the main menu"

  choice = gets.chomp.capitalize

  while choice != "Exit" && choice != ""
    selected_planet = select_planet(solar_system, choice)
    if selected_planet == nil
      puts "#{choice.capitalize} is not in the solar system. Please choose another planet or type 'exit' to go back to the main menu"
      choice = gets.chomp.capitalize
    else
      puts solar_system.get_info(selected_planet)

      puts "\nWhat planet would you like to learn about now?"
      choice = gets.chomp.capitalize
    end
  end

  return return_to_main_menu
  # main_menu
  # choice = gets.chomp.capitalize
  # return choice
end

mercury = Planet.new("Mercury", 4879.4, 3.3e23, 0, 57_909_175, 87.97)
venus = Planet.new("Venus", 12_104, 4.87e24, 0, 108_208_930, 224.7)
earth = Planet.new("Earth", 12_756, 5.98e24, 1, 149_597_890, 365.26)
mars = Planet.new("Mars", 6787, 6.42e23, 2, 227_936_640, 686.98)
jupiter = Planet.new("Jupiter", 142_800, 1.90e27, 53, 778_412_020, 4331.98)
saturn = Planet.new("Saturn", 120_660, 5.69e26, 53, 1_426_725_400, 10_760.56)
uranus = Planet.new("Uranus", 51_118, 8.68e25, 27, 2_870_972_200, 30_685)
neptune = Planet.new("Neptune", 49_528, 1.02e26, 13, 4_498_252_900, 60_190)

planet_list = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]

ss = SolarSystem.new(planet_list, 4.6e9)

def view_solar_system(solar_system)
  puts intro(solar_system)

  main_menu
  choice = gets.chomp.downcase

  while choice != "exit" && choice != ""

    case choice.to_i
    when 1
      choice = learn(solar_system)
    when 2
      choice = create_planet(solar_system)
    when 3
      choice = add_planet(solar_system)
    else
      puts "Invalid selection. Please choose an option between 1 and 3, or type 'exit' to quit"
      choice = gets.chomp.downcase
    end
  end

  puts "Leaving the solar system..."
end

view_solar_system(ss)
