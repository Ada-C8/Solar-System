######### Solar System Class below #######

class SolarSystem

  attr_accessor :name, :planets, :age

  def initialize(name, planets, age) #planets is an array of Planet objects
    @name = name
    @planets = planets
    @age = age
  end

  def add_planet(new_planet) #adds a new Planet object to the existing array of Planets
    @planets << new_planet
  end

  def list_planets
    @planet_names = []

    @planets.each_with_index do |planet, idx|
      @planet_names << " #{idx + 1 }. #{planet.name} "
    end

    return @planet_names
  end


#### Calculate Planetary distance - revisit to see if this method works as it should and whether it belongs in the solarsystem class
  # def planetary_distance(input_planet)
  #   @planetary_distances = []
  #
  #   @planets.each do |planet|
  #     if input_planet.name != planet.name
  #       @planetary_distances << " #{input_planet.name} is #{(input_planet.distance_from_sun - planet.distance_from_sun).abs.round(2)} million kms away from #{planet.name}"
  #     end
  #   end
  #
  #   return @planetary_distances
  # end

end #end of class Solarsystem definition


#######PLANET CLASS DEFINITION###########
class Planet
  attr_accessor :discoverer, :discovered_year, :travel_advice
  attr_reader :name, :distance_from_sun, :year_length, :diameter, :zodiac, :number_of_moons

  def initialize(name, dist_sun, yr_length, diam, zodiac_sign, num_moons)
    @name = name
    @distance_from_sun = dist_sun
    @year_length = yr_length
    @diameter = diam
    @zodiac = zodiac_sign
    @number_of_moons = num_moons

    @discoverer = "UNKNOWN"
    @discovered_year = "UNKNOWN"

    @travel_advice = "None submitted"
  end #end initialize

  ### alternative way to initialize below, explore further
  # def initialize args
  #   args.each do |k,v|
  #     instance_variable_set("@#{k}", v) unless v.nil?
  #   end

  def attributes
    return " Planet Name: #{@name}\n Distance from Sun: #{@distance_from_sun} million km \n Year Length:#{@year_length} days \n Diameter: #{@diameter} km \n Zodiac Planetary Ruler for: #{@zodiac} \n Number of moons: #{@number_of_moons}" + " \n Discovered by #{@discoverer} in the year #{@discovered_year} " + "\n \n Travel Advice and Notes: #{@travel_advice}"
  end

end # end planets


####### Create planets using planet objects below #####
def create_planet
  puts "\nPlease input the following information about your new planet:"

  puts "Name of Planet:"
  new_planet_name = gets.chomp.capitalize

  puts "Distance from sun (in million km):"
  new_planet_distance_from_sun = gets.chomp.to_i

  puts "Year length (in days):"
  new_planet_year_length = gets.chomp.to_i

  puts "Diameter (in km):"
  new_planet_diameter = gets.chomp.to_i

  puts "Affiliated Zodiac Sign"
  new_planet_zodiac = gets.chomp.capitalize

  puts "Number of moons:"
  new_planet_num_moons = gets.chomp.to_i

  return Planet.new(new_planet_name, new_planet_distance_from_sun, new_planet_year_length, new_planet_diameter, new_planet_zodiac, new_planet_num_moons)
end

#########end##########


#### Hard coding in a preset array of Planets to initialize our Hitchhiker's Guide. This Guide is specific  to the new galaxy, Bamboozle

mercury = Planet.new("Mercury", 57.9, 88, 4878, "Gemini and Virgo",0)
venus = Planet.new("Venus", 108.2, 224, 12104, "Taurus and Libra", 0)
earth = Planet.new("Earth", 149.6, 365.25, 12756, "Nothing. Earth is not a zodiac ruler :(", 1)
earth.travel_advice = "Mostly harmless."
mars= Planet.new("Mars", 227.9, 687, 6794, "Aries", 2)
jupiter = Planet.new("Jupiter", 778.3, 4328.9, 142984, "Sagittarius", 66)
saturn = Planet.new("Saturn", 1427, 10585, 120536, "Capricorn", 62)
uranus = Planet.new("Uranus", 2871, 30660, 51118, "Aquarius", 27)
neptune = Planet.new("Neptune", 44971, 60152, 49532, "Pisces", 14)


planets_array = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
amy_galaxy = SolarSystem.new("Bamboozle",planets_array, 1000)

def find_idx(planet_name, planet_array)
  idx = nil
  planet_array.each_with_index do |planet, index|
    if planet.name == planet_name.capitalize
      idx = index
    end
  end

  idx
end


########## UI #######

# puts amy_galaxy.planetary_distance(earth)

puts "\nWelcome to the Hitchhiker's Guide to the #{amy_galaxy.name} Galaxy!"


puts "\nYou can: \n 1. Look up a planet \n 2. Submit a new planet entry \nPlease enter 1 or 2 to select your option."
action = gets.chomp.to_i

until (action == 1 || action == 2)
  puts "Error: Please select option 1 or 2"
  action = gets.chomp.to_i
end

if action == 1
  continue = nil

  until continue == "no"
    puts "\nThe known planets in the #{amy_galaxy.name} Galaxy are:"

    puts amy_galaxy.list_planets
    puts "\nWhich planet would you like to learn about? (Enter the name of the planet)"

    destination_planet = gets.chomp.capitalize

    idx_of_planet = find_idx(destination_planet, planets_array)

    until idx_of_planet # ensures user only selects planet that exists in our galaxy
      puts "\nI'm sorry, that planet is not in the #{amy_galaxy.name} Galaxy. Please select a different planet. Your options are: "

      puts amy_galaxy.list_planets
      destination_planet = gets.chomp.capitalize
      idx_of_planet = find_idx(destination_planet, planets_array)
    end

    puts " \n Ahhh... #{destination_planet}."
    puts " \n#{amy_galaxy.planets[idx_of_planet].attributes}"


    puts "\nWould you like to learn about another planet? (yes/no)"
    continue =  gets.chomp.downcase
    until continue == "yes" || continue == "no"
      puts "Invalid input. Please type 'yes' or 'no'."
      continue = gets.chomp.downcase
    end

  end # end of until loop

##Ask user if they've discovered a new planet and prompt them to submit a new entry if yes
  puts "Have you, by any chance, recently discovered a new planet in this galaxy? (yes/no)"

  discovered = gets.chomp.downcase
end #end of option 1



if action == 2 || discovered =="yes"
  puts "\nAwesome, congrats on discovering a new planet!"
  new_planet = create_planet

  puts "What is your name? (so we can give you credit)"
  new_planet.discoverer = gets.chomp.capitalize

  puts "What year did you discover this?"
  new_planet.discovered_year = gets.chomp.to_i

  puts "Any travel notes or advice?"
  new_planet.travel_advice = gets.chomp

  amy_galaxy.add_planet(new_planet)
  idx_of_new_planet = find_idx(new_planet.name, planets_array)

  puts "\nThanks for your contribution the Hitchhiker's Guide to the #{amy_galaxy.name} Galaxy! Here is your new entry:"
  puts "\n" + amy_galaxy.planets[idx_of_new_planet].attributes
end

puts "\nThanks for reading the Hitchhiker's Guide to the #{amy_galaxy.name} Galaxy. Make sure you've packed your towel. So long, and thanks for all the fish.\n \nDON'T PANIC"


### Future refactoring and enhancements
# explore to see if it is possible to make newly added planet entries available each time the program runs
# prevent user error at all points of user input
# give user  achance to select between galaxies
# give user the ability to enter in new travel advice (maybe in an option 3 at the beginning)
# modify the continue/ until loops so that user has a choice after each action to do option 1 or 2
# method for age/year of planet and planetary distance
