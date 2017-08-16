
#SETTING CLASSES
class Planet
  attr_reader :name, :year_length, :distance_from_sun, :type, :moons,
  :inhabitants

  def initialize(name, year_length, distance_from_sun, type, moons, inhabitants)
    @name = name
    @year_length = year_length
    @distance_from_sun = distance_from_sun
    @type = type
    @moons = moons
    @inhabitants = inhabitants
  end

  def planet_all_info
    output = ""
    output << "\n    Planet name: #{name}
    Length of year in earth-days: #{year_length}
    Distance from the sun in some units: #{distance_from_sun}
    Class type: #{type}
    Number of Moons: #{moons}
    Home to: #{inhabitants}\n "
    return output
  end
end

class SolarSystem
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def ss_name_list
    i=1
    name_list = ""
    planets.each do |planets|
      name_list<< "#{i}. #{planets.name}\n"
      i +=1
    end
    return name_list
  end

end

#DEFINING METHODS
#is the user input a y or a n?  if not, keep cylcing through
def y_or_n(input)
  until input == "Y" || input == "N"
    puts "Say what? Please enter a Y or an N"
    input = gets.chomp.upcase
  end
  return input
end

#Checks that the user-inputed planet name is the name of a planet
#in this solar system. Maybe there is a way to do this without
#building an array of names? If it is not a name then the program
#asks the user for a name until they can manage to enter a name.
def input_is_name (my_solar_system, input)
  name_array = []
  n = 0
  my_solar_system.planets.length.times do
    name_array << my_solar_system.planets[n].name.downcase
    n = n+1
  end
  return name_array.include?(input)
end

# series of prompts that lets the user explore the informaiton about
# different planets
def learn_about_system(my_solar_system)
  puts "Would you like to learn more about one of these planets? (Y/N)"
  learn_more = gets.chomp.upcase
  learn_more = y_or_n(learn_more)
  if learn_more == "Y"
    continue ="Y"
    while continue == "Y"
      puts "Please write the planet's name."
      user_interest = gets.chomp.downcase

      while !input_is_name(my_solar_system, user_interest)
        puts "That is not an option.  Please select a planet on the list."
        user_interest = gets.chomp.downcase
      end

      puts "\nHere is information you asked for:"
      n=0
      my_solar_system.planets.length.times do
        if my_solar_system.planets[n].name.downcase == user_interest
          output = my_solar_system.planets[n].planet_all_info
          puts output
        end
        n +=1
      end

      puts "\n Would you like to hear about another planet? (Y/N)"
      continue = gets.chomp.upcase
      continue = y_or_n(continue)
    end
  else
    puts "Ok, I won't tell you any more about my planets"
  end
end

#prompts the user to input all the the information to define a new planet
#and makes the new planet
def make_a_planet(name)
  puts "How long is a year on #{name}? (in earth-days)"
  year_length = gets.chomp
  puts "How far form the sun is #{name} (in units)?"
  distance_from_sun = gets.chomp
  puts "If this was a star trek episode, what type of planet is #{name}?"
  type = gets.chomp
  puts "How many moons does #{name} have?"
  moons = gets.chomp
  puts "Does an intelligent species live on #{name}? (Y/N)"
  species = gets.chomp.upcase
  species = y_or_n(species)
  if species == "N"
    inhabitants = "No inteligent life"
  else
    puts "What is the species name?"
    inhabitants = gets.chomp
  end
  new_planet = Planet.new(name, year_length, distance_from_sun, type, moons, inhabitants)
  return new_planet
end

#asks the user if they would like to define a new planet.
# If yes, it allows them too.
def user_defined_planet(my_solar_system)
  puts "I can help you define a new planet. Would you like to?"
  wants_to_define = gets.chomp.upcase
  wants_to_define = y_or_n(wants_to_define)

  if wants_to_define == "Y"
    puts "Great! Please enter the name of your new planet"
    name = gets.chomp.capitalize
    new_planet = make_a_planet(name)
    puts "This is the information on the planet you just entered"
    puts new_planet.planet_all_info
    #could ask user if that info is correct here, and allow changes if not.
    my_solar_system.add_planet(new_planet)
    puts "\nHere is the updated list of planets in my solar system"
    puts my_solar_system.ss_name_list
    puts ""
  else
    puts "Well OK then."
  end
  return my_solar_system
end

#SETTING VARIABLES
#these are hardcoded planets in my starter solar system
first = Planet.new("Caprica", 102, 230, "M", 4, "Humans")
second = Planet.new("Vulcan", 40, 100 ,"M", 2, "Vulcans")
third = Planet.new("Delta Vega", 50, 1100, "A", 1, "No inteligent life" )
forth = Planet.new("Alpha Onias III", 102, 230, "M", 1, "Barash")

#build my starter solar system
my_solar_system = SolarSystem.new([first, second, third, forth])

puts "\nHere are the planets in my solar system"
puts planets_in_my_solar_system = my_solar_system.ss_name_list
puts ""

learn_about_system(my_solar_system)
my_solar_system =user_defined_planet(my_solar_system)
#by going back throug the learn_about_system this demonstrates that you
#can now learn about the planet you just entered.
learn_about_system(my_solar_system)
#could have automatic way to cycle through these.  Also include a quit option.



#This method to determine distance between planets works, but it is very ugly
# def distance_from_each_other(my_solar_system, planet1_name, planet2_name)
#   i=0
#   my_solar_system.planets.length.times do
#     if  my_solar_system.planets[i].name == planet1_name
#       $planet1_dist_sun = my_solar_system.planets[i].distance_from_sun
#     end
#     i += 1
#   end
#
#   i=0
#   my_solar_system.planets.length.times do
#     if my_solar_system.planets[i].name == planet2_name
#       $planet2_dist_sun = my_solar_system.planets[i].distance_from_sun
#     end
#     i += 1
#   end
#
#   if $planet2_dist_sun > $planet1_dist_sun
#     distance = $planet2_dist_sun - $planet1_dist_sun
#   elsif $planet2_dist_sun < $planet1_dist_sun
#     distance = $planet1_dist_sun - $planet2_dist_sun
#   else
#     distance = 0
#   end
#   return distance
# end
#
# puts distance_from_each_other(my_solar_system, "Caprica", "Vulcan")
# puts distance_from_each_other(my_solar_system, "Delta Vega", "Vulcan")
