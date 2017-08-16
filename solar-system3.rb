
class Planet
  attr_accessor :name, :size, :rings, :distance_from_the_sun, :year_length

  def initialize(name, size, rings, distance_from_the_sun, year_length)
    @name = name.capitalize
    @size = size
    @rings = rings
    @distance_from_the_sun = distance_from_the_sun
    @year_length = year_length
  end

  def educate
    puts "#{@name} is a planet that is #{@size} twinkies in diameter. It #{@rings} rings, so sometimes it feels insecure. It is #{distance_from_the_sun} leagues from the sun and takes #{year_length} readings of \"War and Peace\" to complete its orbit."
  end

end

##################################################################################################

def dist_btw_planets(selected_planet, other_planets) #a is the planet of interest, b is an array of all the planets
  other_planets.each do |planet|
    distance = (selected_planet.distance_from_the_sun - planet.distance_from_the_sun).abs
    unless selected_planet == planet
    puts "#{selected_planet.name} is #{distance} leagues from #{planet.name}."
    end
  end
end

##################################################################################################

class SolarSystem
  attr_accessor :planets
  attr_reader :age

  def initialize(planets, age) #planets arg must be an array of Planets
    @planets = planets
    @age = age
  end

  def add(planet)
    @planets << planet
  end

  def local_year(planet) #planet arg must be an instance of Planet
    @age / planet.year_length
  end

  def list_planets
    list = ""
    (1..(@planets.length)).each do |i|
      list += "#{i}. #{@planets[i - 1].name}\n"
    end
    return list
  end
end

##################################################################################################

# Used during make_planet to force user to input an integer when assigning quantitative Planet attributes
def force_int(string)
  until string == string.to_i.to_s
    print "Please enter an integer: "
    string = gets.chomp
  end
  return string.to_i
end

def make_planet
  new_planets = []
  puts "Want to make a new planet? y/n"
  input = gets.chomp.downcase
  until input == "n"
    print "What is your planet's name?: "
    name = gets.chomp.downcase
    print "What is the diameter of your planet in miles?: "
    size = force_int(gets.chomp)
    print "Does your planet have rings? y/n: "
    rings = gets.chomp.downcase
    until rings == "y" || rings == "n"
      print "Please answer y or n: "
      rings = gets.chomp.downcase
    end
    rings == "y" ? rings = "has" : rings = "does not have"
    print "In miles, how far is you planet from the sun?: "
    distance_from_the_sun = force_int(gets.chomp)
    print "In years, how long does it take your planet to complete its orbit?: "
    year_length = force_int(gets.chomp)

    new_planet = Planet.new(name, size, rings, distance_from_the_sun, year_length)
    new_planets << new_planet
    puts "Want to make a new planet? y/n"
    input = gets.chomp.downcase
  end
  return new_planets
end

##################################################################################################

# Call make_planet and store the array it returns

new_planets = make_planet

# Hard code some instances of the Planet object!
#(name, size, rings, distance_from_the_sun, year_length)

bobo = Planet.new("bobo", 5, "has", 17, 92)
garflaz = Planet.new("garflaz", 45, "does not have", 62, 88)
flufflebottom = Planet.new("flufflebottom", 57, "does not have", 99, 6)

#Add hard-coded planets to a new instance of SolarSystem

crazytown = SolarSystem.new([bobo, garflaz, flufflebottom], 600)

#Add any user-created planets to the crazytown SolarSystem.
#Add user-created planet names to a reference array. Use this to list_planets in crazytown later.

new_entries = []

new_planets.each do |planet|
  crazytown.add(planet)
  new_entries << planet.name.downcase
end

##################################################################################################

puts "Welcome to the Encyclopedia of Obscure Planets!"
puts "Would you like to learn about a new planet? y/n"

response = gets.chomp

until response == "n"
  puts "Choose one of the following:"
  puts crazytown.list_planets
  choice = gets.chomp.downcase
  if choice == "bobo" || choice == "1"
    bobo.educate
    puts "The year on this planet is #{crazytown.local_year(bobo)}."
    dist_btw_planets(bobo, crazytown.planets)
  elsif choice == "garflaz" || choice == "2"
    garflaz.educate
    puts "The year on this planet is #{crazytown.local_year(garflaz)}."
    dist_btw_planets(garflaz, crazytown.planets)
  elsif choice == "flufflebottom" || choice == "3"
    flufflebottom.educate
    puts "The year on this planet is #{crazytown.local_year(flufflebottom)}."
    dist_btw_planets(flufflebottom, crazytown.planets)
  elsif new_entries.include?(choice) #allow user to name new planet they want to learn about
    index = new_entries.find_index(choice)
    new_planets[index.to_i].educate
    puts "The year on this planet is #{crazytown.local_year(new_planets[index.to_i])}."
    dist_btw_planets(new_planets[index.to_i], crazytown.planets)
  elsif choice.to_i > 0 && choice.to_i <= (3 + new_entries.length) #allow user to give the list number of the planet they want to learn about
    new_planets[choice.to_i - 4].educate
    puts "The year on this planet is #{crazytown.local_year(new_planets[choice.to_i - 4])}."
    dist_btw_planets(new_planets[choice.to_i - 4], crazytown.planets)
  else
    puts "I'm afraid this is an older edition, that planet is not in this Encyclopedia...yet!"
  end
  puts "Well that was fun! Would you like to learn about another planet? y/n"
  response = gets.chomp
end
