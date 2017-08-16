class SolarSystem
  def initialize(planets)
    @planets = planets
  end

  def planets
    return @planets
  end

  def add_planet(new_planet)
    @planets = @planets << new_planet
    # solar = solar << new_planet
  end

  def print_planets_name
    i = 0
    @planets.each do |n|
      puts "#{i = i + 1}. #{n.planet_name}"
    end
  end

  def print_planets_info
    i = 0
    @planets.each do |n|
      puts "#{i = i + 1}. #{n.planet_name} : #{n.year_length} days, #{n.distance_from_sun} from sun"
    end
  end
end

class Planet
  attr_accessor :planet_name, :year_length, :distance_from_sun, :is_there_life, :diameter

  def initialize(planet_name, year_length, distance_from_sun, is_there_life, diameter)
    @planet_name = planet_name
    @year_length = year_length
    @distance_from_sun = distance_from_sun
    @is_there_life = is_there_life
    @diameter = diameter
  end

  def print_planet_info
    puts "#{planet_name} is #{distance_from_sun} from sun and takes #{year_length} to orbit it. It is #{diameter} in diameter and it is said to be #{is_there_life} that it contains life."
    return
  end
end

earth_object = Planet.new("Earth", "365.24 days", "149,598,262 km (1 AU)", "true", "12,742 km")
mercury_object = Planet.new("Mercury", "88 days", "	57,909,227 km (0.39 AU)", "false", "4,879 km")
saturn_object = Planet.new("Saturn", "29.5 years", "1,426,666,422 km (9.58 AU)", "false", "116,464 km")

solar = SolarSystem.new([earth_object, mercury_object, saturn_object])

# begin program for user query
puts "Choose a planet to learn more about:"
solar.print_planets_name # calls the print_planets method

puts "Answer:"
user_query = gets.chomp.to_i

if user_query == 1 || user_query == 2 || user_query == 3
  puts "OK, here is info about planet #{user_query}: "
  puts solar.planets[user_query - 1].print_planet_info
else
  puts "not an option"
end

puts "Would you like to add your own planet?(Y/n)"
answer = gets.chomp

if answer == "Y"
  puts "Ok, lets do it!"
  puts "What's the name of your planet?"
  user_planet = gets.chomp
  # puts "What is the planet's year length?"
  # user_year_length = gets.chomp
  # puts "What is the planet's distance from the sun?"
  # user_distance = gets.chomp
  # puts "Is there life on the planet?"
  # user_is_life = gets.chomp
  # puts "What is the planet's diameter?"
  # user_diameter = gets.chomp
  # solar.add_planet(user_planet(user_year_length, user_distance, user_is_life, user_diameter))
  solar.add_planet(user_planet)
  puts solar.planets
  # puts solar.planets.print_planet_info
elsif answer == "n"
  puts "Thank you for using the Solar System program! Goodbye."
else
  puts "That's not an option"
end



# solar = SolarSystem.new("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Hoth")
# solar = SolarSystem.new([{:planet_name => "Mercury", :year_length => 88, :distance_from_sun => "36 million mi", :is_there_life => false, :average_temp => 32},
# {:planet_name => "Earth", :year_length => 365, :distance_from_sun => "92 million mi", :is_there_life => true, :average_temp => 12}])
