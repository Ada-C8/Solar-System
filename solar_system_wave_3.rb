# ###########################################################################

#THE CODE BELOW IS FOR WAVE 3, WITHOUT ANY ENHANCEMENTS!
class Planet
  attr_reader :name, :age, :number_from_sun, :number_of_rings, :number_of_moons
  def initialize(name, age, number_from_sun, number_of_rings, number_of_moons)
    @name = name
    @age = age
    @number_from_sun = number_from_sun
    @number_of_rings = number_of_rings
    @number_of_moons = number_of_moons
  end

  def planet_info
    return "#{@name} is #{@age} years old, has #{@number_of_moons} moon(s) and #{@number_of_rings} rings, and there are #{@number_from_sun} planets between it and then sun."
  end
end # of planet class

earth = Planet.new("Earth", "4.543 billion", 2, 0, 1)
mars = Planet.new("Mars", "4.503 billion", 3, 0, 2)


class SolarSystem
  attr_reader :planets

  def initialize(*planets)
    @planets = planets
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def return_planet_info
    info = ""
    @planets.each_with_index do |x, i |
      info += "\n#{i + 1}. #{x.planet_info}"
    end
    return info
  end

  def info_for_one_planet(user_input)
    info = ""
    @planets.each_with_index do |planet, i |
      if planet.name == user_input
        info += "#{planet.planet_info}"
      end
    end
    return info
  end

  def return_planet_names
    name_info = []
    @planets.each_with_index do |x, i|
      name_info << "#{x.name}"
    end
    return name_info
  end
end #of SolarSystem class

my_solar = SolarSystem.new(earth, mars)

def build_a_planet(name)
  planet_name = name
  puts "How old is #{name}?"
  planet_age = gets.chomp
  puts "How many planets are between #{name} and the sun?"
  planet_till_sun = gets.chomp.to_i
  puts "How many rings does #{name} have?"
  planet_rings = gets.chomp
  puts "How many moons does #{name} have?"
  planet_moons = gets.chomp.to_i
  #earth will be set equal to what comes after return
  return Planet.new(planet_name, planet_age, planet_till_sun, planet_rings, planet_moons)
end #of build_a_planet

user_choice = 0
until user_choice == "done"
  puts "\nWelcome to the solar system! If you would like to learn about a planet in the solar system enter 'learn', or, if you want to add a planet to the solar system enter 'add'. Enter 'done' to exit the program."
  user_choice = gets.chomp.downcase
  until user_choice == "learn" || user_choice == "add" || user_choice == "done"
    puts "Please enter one of the three options: learn, add, or done!"
    user_choice = gets.chomp.downcase
  end
  case user_choice
  when "learn"
    puts "\nLet's learn about a planets!"
    puts "What planet would you like to learn about?"
    choice = gets.chomp

    until my_solar.return_planet_names.include?(choice.capitalize)
      puts "Please enter one of these planets: #{my_solar.return_planet_names}"
      choice = gets.chomp
    end

    puts "Ok, here is some information about #{choice.downcase}: \n #{my_solar.info_for_one_planet(choice.capitalize)}"
  when "add"
    puts "\nLet's add a planet!"
    puts "Please enter the name of the planet you want to add to the solar system:"
    user_name = gets.chomp.downcase
    user_name = build_a_planet(user_name.capitalize)
    my_solar.add_planet(user_name)
  when "done"
    exit
  end
end #whole loop

#############################################################################################

#THE CODE BELOW IS FOR WAVE 3, WITH distance_to_sun Methods ADDED (but not totally functional in the program as a whole yet!)
# class Planet
#   attr_reader :name, :age, :number_from_sun, :number_of_rings, :number_of_moons, :distance_to_sun
#   def initialize(name, age, number_from_sun, number_of_rings, number_of_moons, distance_to_sun)
#     @name = name
#     @age = age
#     @number_from_sun = number_from_sun
#     @number_of_rings = number_of_rings
#     @number_of_moons = number_of_moons
#     @distance_to_sun = distance_to_sun
#   end
#
#   def planet_info
#     return "#{@name} is #{@age} years old, has #{@number_of_moons} moon(s) and #{@number_of_rings} rings, there are #{@number_from_sun} planets between #{@name} and then sun, and #{@name} is #{distance_to_sun} from the sun."
#   end
# end # of planet class
#
# earth = Planet.new("Earth", "4.543 billion", 2, 0, 1, 92.96)
# mars = Planet.new("Mars", "4.503 billion", 3, 0, 2, 146.6)
#
#
# class SolarSystem
#   attr_reader :planets
#
#   def initialize(*planets)
#     @planets = planets
#   end
#
#   def add_planet(new_planet)
#     @planets << new_planet
#   end
#
#   def return_planet_info
#     info = ""
#     @planets.each_with_index do |x, i |
#       info += "\n#{i + 1}. #{x.planet_info}"
#     end
#     return info
#   end
#
#   def distance_from(input_1, input_2)
#     planet_1 = 0
#     distance_1 = 0
#     @planets.each do |planet|
#       if planet.name == input_1.downcase.capitalize
#         planet_1 = planet.name
#         distance_1 = planet.distance_to_sun
#       end
#     end
#     planet_2 = 0
#     distance_2 = 0
#     @planets.each do |planet|
#       if planet.name == input_2.downcase.capitalize
#         planet_2 = planet.name
#         distance_2 = planet.distance_to_sun
#       end
#     end
#     return "#{planet_1} and #{planet_2} are #{(distance_1 - distance_2
#     ).abs} million miles apart"
#   end#distance_from
#
#   def info_for_one_planet(user_input)
#     #does this next line need to be here? Is it left over from Dan?
#     puts "user input: #{user_input}"
#     info = ""
#     @planets.each_with_index do |planet, i |
#       puts "planet: #{planet}"
#       puts "planet == user_input: #{planet == user_input}"
#       if planet.name == user_input
#         info += "#{planet.planet_info}"
#       end
#     end
#     return info
#   end
#
#   def return_planet_names
#     name_info = []
#     @planets.each_with_index do |x, i|
#       name_info << "#{x.name}"
#     end
#     return name_info
#   end
# end #of SolarSystem class
#
# my_solar = SolarSystem.new(earth, mars)
#
# def build_a_planet(name)
#   planet_name = name
#   puts "How old is #{name}?"
#   planet_age = gets.chomp
#   puts "How many planets are between #{name} and the sun?"
#   planet_till_sun = gets.chomp.to_i
#   puts "How many rings does #{name} have?"
#   planet_rings = gets.chomp
#   puts "How many moons does #{name} have?"
#   planet_moons = gets.chomp.to_i
#   puts "How far away is #{name} from the sun (million miles)"
#   distance_to_sun = gets.chomp.to_i
#   #earth will be set equal to what comes after return
#   return Planet.new(planet_name, planet_age, planet_till_sun, planet_rings, planet_moons, distance_to_sun)
# end #of build_a_planet
#
# #Testing if distance_from works
# test = my_solar.distance_from("Earth", "Mars")
#
# puts test
# user_choice = 0
# until user_choice == "done"
#   puts "\nWelcome to the solar system! If you would like to learn about a planet in the solar system enter 'learn', or, if you want to add a planet to the solar system enter 'add'. Enter 'done' to exit the program."
#   user_choice = gets.chomp.downcase
#   until user_choice == "learn" || user_choice == "add" || user_choice == "done" || user_choice == "distance"
#     puts "Please enter one of the three options: learn, add, or done!"
#     user_choice = gets.chomp.downcase
#   end
#   case user_choice
#   when "learn"
#     puts "\nLet's learn about a planets!"
#     puts "What planet would you like to learn about?"
#     choice = gets.chomp
#
#     until my_solar.return_planet_names.include?(choice.capitalize)
#       puts "Please enter one of these planets: #{my_solar.return_planet_names}"
#       choice = gets.chomp
#     end
#
#     puts "Ok, here is some information about #{choice.capitalize}: \n #{my_solar.info_for_one_planet(choice)}"
#   when "add"
#     puts "\nLet's add a planet!"
#     puts "Please enter the name of the planet you want to add to the solar system:"
#     user_name = gets.chomp.downcase
#     user_name = build_a_planet(user_name.capitalize)
#     my_solar.add_planet(user_name)
#   when "distance"
#     puts "\nLet's look at the distance between two planets!"
#     puts "Please enter the name of the first planet:"
#       user_planet_1 = gets.chomp.downcase.capitalize
#     puts "Please enter the name of the second planet:"
#       user_planet_2 = gets.chomp.downcase.capitalize
#       #need to get this code below to print!
#       my_solar.distance_from(user_planet_1, user_planet_2)
#   when "done"
#     exit
#   end
# end #whole loop

# # Ensure that the each planet has a @distance_from_the_sun attribute. Using this data, add a method to determine the distance from any other planet (assuming planets are in a straight line from the sun)
