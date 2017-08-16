# assignment to learn about classes and methods
# gives info about planets in a solar system, allows user to create new planet class
# ada week 2, ruby basics

class SolarSystem
  attr_accessor :planets, :name, :age
  #don't know if accessor is right here, or in Planet, but I didn't have the bandwidth to play with public/private methods...

  def initialize(name, age, planets)
    @name = name
    @age = age
    @planets =  planets


  end

# method to add a new planet
  def add_planet(input)
    @planets << input
  end

# method to return one piece of data from a planet
  def planet_method(planet_name, method)
    case method
    when :name
      info = planets_by_name(planet_name).name
    when :mass
      info = planets_by_name(planet_name).mass
    when :index_from_sun
      info = planets_by_name(planet_name).index_from_sun
    when :circumference
      info = planets_by_name(planet_name).circumference
    when :color
      info = planets_by_name(planet_name).color
    when :year_length
      info = planets_by_name(planet_name).year_length
    when :distance_from_sun
      info = planets_by_name(planet_name).distance_from_sun
    when :all_facts
      info = planets_by_name(planet_name).all_facts
    else
      puts "error"
      return
    end

    return info
  end

  # doesn't work because it calls methods that call it?
  # def planets_by_name(name)
  #   index = all_planets(:name).index(name.capitalize.to_s)
  #   return @planets[index]
  # end

  # method to access the planet class by name so as to use planet methods on it
  def planets_by_name(name)
    planet_names = []
    @planets.each do |planet_class|
      planet_names << planet_class.name
    end
    index = planet_names.index(name.capitalize.to_s)
    return @planets[index]
  end

# method to create an array one method for all planet classes
  def all_planets(method)
    method_array =[]
    @planets.each do |planet_class|
      method_array << planet_method(planet_class.name, method)
    end
    return method_array
  end


# method to print the planet names in various ways
  def list(type)
    planet_list = ""

    all_planets(:name).length.times do |i|
      planet_list += "#{i + 1}. #{all_planets(:name)[i]}"
      if type == :line
        planet_list += "\n"
      elsif type == :tab
        planet_list += "\t"
      elsif type == :comma
        planet_list += ", "
      else
        puts "error"
      end
    end

    return planet_list
  end

# method to create a table with info from each planet called by the array passed to table_create
  def table_create(table_arr)

    planet_table_headings = ["Name", "|Mass", "|Index from Sun", "|Circumference", "|Color", "|Year Length", "|Distance from the Sun"]

    planet_table_units = [" ", "|in kg", "|", "|in miles", "| ", "|in Earth years", "|in AU"]

    printf "%-15s%-15s%-15s%-15s%-15s%-15s%-15s\n" % planet_table_headings
    printf "%-15s%-15s%-15s%-15s%-15s%-15s%-15s\n" % planet_table_units

    table_arr.length.times do |i|
      planet_table_values = planet_method(table_arr[i], :all_facts)
      puts "-" * 105
      printf "%-15s|%-14s|%-14s|%-14s|%-14s|%-14s|%-14s\n" % planet_table_values
    end
  end

# method to find the distance between planets
  def distance_from_other(planet1, planet2)
    distance = planets_by_name(planet2).distance_from_sun - planets_by_name(planet1).distance_from_sun
    return distance.abs
  end

# method to find the amount of planet's years since the SS began
  def years_since_birth(planet)
    local_year = age / planets_by_name(planet).year_length
    # local_year = "%e" %local_year #converts to scientific notation
    return local_year
  end

end


class Planet
  attr_accessor :name, :mass, :index_from_sun, :circumference, :color, :year_length, :distance_from_sun

  def initialize(name, mass, index_from_sun, circumference, color, year_length, distance_from_sun)
    @name = name
    @mass = mass
    @index_from_sun = index_from_sun
    @circumference = circumference
    @color = color
    @year_length = year_length
    @distance_from_sun = distance_from_sun
  end


  def all_facts
    info = [name, mass, index_from_sun, circumference, color, year_length, distance_from_sun]
    return info
  end

end


mercury_class = Planet.new("Mercury", 3.285e+23, 1, 9525, "Orange", 0.24, 0.39)
venus_class = Planet.new("Venus", 4.87e+24, 2, 23628, "Yellow", 0.62, 0.72)
earth_class = Planet.new("Earth", 5.972e+24, 3, 24901, "Blue", 1.0, 1.0)
mars_class = Planet.new("Mars", 6.39e+23, 4, 13263, "Red", 1.88, 1.52)
jupiter_class = Planet.new("Jupiter", 1.898e+27, 5, 272946, "Striped", 11.78, 5.2)

our_solar_system = SolarSystem.new("Milky Way", 1.32e+10, [mercury_class, venus_class, earth_class, mars_class, jupiter_class])

pluto_class = Planet.new("Pluto", 1.309e+22, 9, 4494, "White", 247.95, 39.5)
our_solar_system.add_planet(pluto_class)

# class tests
# puts our_solar_system.age
# puts our_solar_system.distance_from_other(:venus, :mars)
# puts our_solar_system.years_since_birth(:earth)

# puts our_solar_system.planets[1]
# puts our_solar_system.list(:line)
# puts our_solar_system.list(:tab)
# puts our_solar_system.list(:comma)
# puts our_solar_system.planets_by_name("venus").color
# puts our_solar_system.table_create([:jupiter, :mars])




#method to get user input to see tables of planet's info (messy)
#there's some functionality for user to return multiple choices at a time, but I haven't gotten there.
#also - if you misspell exit you have to name a planet before you can exit
#also just generally I think the flow is off but I just can't even, so this is how it will stay.
def planet_info_finder(solar_system)
  option_list = "#{solar_system.list(:comma)} #{solar_system.all_planets(:name).length + 1}. Exit"
  puts "What planet would you like to learn about today?"
  puts option_list
  user_interest = gets.chomp.capitalize


  until user_interest.downcase == "exit"
    until solar_system.all_planets(:name).include?(user_interest)
      puts "That is not a planet in our Solar System. Please choose another planet."
      user_interest = gets.chomp.capitalize
    end

    puts solar_system.table_create([user_interest.to_s])
    puts "Ok, what next?"
    puts option_list
    user_interest = gets.chomp.capitalize
  end
  # puts "Live long and prosper"
end

# collect user input for new planet
def new_planet
  puts "So you want to create a new planet? This database will need the following information:"
  print "What is your planet's name?"
  name = gets.chomp
  print "What is its mass (in kg)?"
  mass = gets.chomp
  print "What position is it away from the sun? i.e. Earth is 3 because it is the 3rd planet from the sun."
  index_from_sun = gets.chomp
  print "What is its circumference (in miles)?"
  circumference =  gets.chomp
  print "What color is it?"
  color = gets.chomp
  print "How long is one year (in Earth days)?"
  year_length = gets.chomp
  print "How far away is it from the sun (in AU)?"
  distance_from_sun = gets.chomp

  new_planet_class = Planet.new(name, mass, index_from_sun, circumference, color, year_length, distance_from_sun)

  return new_planet_class
end





puts "Welcome to the #{our_solar_system.name} Solar System."


planet_info_finder(our_solar_system)

new_class = new_planet

puts "Thank you for visiting the #{our_solar_system.name} Solar System.\n Please come again soon.\n Bye bye!"

# creates the opening menu selections
# doesn't work. its close but not there and I decided to give up.
# begin
#   puts "Would you like to\n[a] create a new planet\n[b] browse the existing planets.\n[c] exit the program"
#   choice = gets.chomp.downcase
#   until choice == "c"
#     if choice == "a"
#       new_class = new_planet
#       our_solar_system.add_planet(new_class)
#
#     elsif choice == "b"
#       planet_info_finder(our_solar_system)
#
#     else choice == "c"
#       puts "Thank you for visiting the #{our_solar_system.name} Solar System.\n Please come again soon.\n Bye bye!"
#       return
#     end
#   end
# rescue
#     puts "That is not a valid option. Please try again."
#   retry
#   puts "Ok, what next?"
#   puts "Would you like to\n[a] create a new planet\n[b] browse the existing planets.\n[c] exit the program"
#   choice = gets.chomp.downcase
# end
