require 'date'

# solar system class
class SolarSystem

  attr_accessor :planet, :add_planet

  def initialize(array_of_planets)
    @array_of_planets = array_of_planets
  end

  # prints sentence descriptions of all planets in solar system
  def solarsystem_sentence_return
    sentences = []
    @array_of_planets.each do |planets|
      sentences << planets.each_planet_return
    end
    return sentences
  end

  # adds new planet to solar system if it's not already there
  def add_planet(new_planet)
    new = 0
    @array_of_planets.each do |each_planet|
      if each_planet.name == new_planet.name
        new += 1
      end
    end
    if new == 0
      @array_of_planets << new_planet
    else
      puts "That planet is already in the solar system!"
    end
  end

  # prints numbered list of all planets in solar system
  def solarsystem_list_return
    list = []
    @array_of_planets.each do |bodies|
      list << "#{@array_of_planets.index(bodies) + 1}. #{bodies.name}"
    end
    return list
  end

  # method for user to learn more about specific planet they ask about
  def user_interaction
    found = false
    puts "What planet would you like to learn about?"
    learn_about = gets.chomp.downcase.capitalize
    @array_of_planets.each do |search|
      if search.name == learn_about
        found = true
        puts "Good news! That planet is in the solar system. Let me tell you about it."
        puts "#{search.each_planet_return}\n"
        break
      end
    end
    unless found == true
      puts "Unfortunately, that planet is not in the solar system, so there's nothing to learn\n"
    end
  end

  # method to calculate distance between the 2 planets entered
  def calc_distance_from_other(planet1, planet2)
    planet1_distance = 0
    planet2_distance = 0
    @array_of_planets.each do |search|
      if search.name == planet1
        planet1_distance = search.distance_from_sun
      end
      if  search.name == planet2
        planet2_distance = search.distance_from_sun
      end
    end
    puts "#{planet1} is #{(planet1_distance - planet2_distance).round(2).abs} million miles from #{planet2}.\n"
  end

end

# =============================

# planet class
class Planet

  attr_accessor :name, :planet_year, :distance_from_sun

  def initialize(info_hash)
    @name = info_hash[:name]
    @planet_year = info_hash[:planet_year]
    @distance_from_sun = info_hash[:distance_from_sun]
  end

  # returns info about specific planet in sentence form
  def each_planet_return
    return "#{@name} is a planet in the solar system that is #{@distance_from_sun} million miles from the sun and has a year length of #{@planet_year} days.\n"
  end

  def planet_name
    return @name
  end

  def planet_year
    return @year
  end

  def planet_distance
    return @distance_from_sun
  end

  # method to calculate how many times a planet has rotated around the sun since the beginning of the solar system
  # note: age of solar system set to arbitrary constant for now
  def local_year
    today = Date.today
    year1 = 1970
    age_of_system = today.year - year1
    age_of_system_days = (today.year - year1) * 365
    puts "The solar system is #{age_of_system} years old. #{planet_name} is #{age_of_system_days / @planet_year} local years old because its year is equal to #{(@planet_year / 365.to_f).round(2)} Earth years.\n"
  end

end

# =============================


# freestanding method to accept user input and return the info in sentence form
# will NOT add the planet to the solar system; use solar_system method add_planet for that purpse
def user_input
  puts "Please enter your planet name, planet year length in days, and distance from the sun separated by commas(,).\n"
  user = gets.chomp.strip.split(",")
  user_planet = {}
  user.each do |hashify|
    user_planet[:name] = user[0]
    user_planet[:planet_year] = user[1].strip
    user_planet[:distance_from_sun] = user[2].strip
  end
  return user_planet
end


# data
mercury_info = {name: "Mercury", planet_year: 88, distance_from_sun: 35.98}
venus_info = {name: "Venus", planet_year: 225, distance_from_sun: 67.24}
earth_info = {name: "Earth", planet_year: 365, distance_from_sun: 92.96}
mars_info = {name: "Mars", planet_year: 687, distance_from_sun: 141.6}
jupiter_info = {name: "Jupiter", planet_year: 4332, distance_from_sun: 483.3}

mercury = Planet.new(mercury_info)
venus = Planet.new(venus_info)
earth = Planet.new(earth_info)
mars = Planet.new(mars_info)
jupiter = Planet.new(jupiter_info)


# tests on planet methods
# =============================

puts venus.planet_name

puts venus.each_planet_return

puts mercury.local_year


# tests on solar system methods
# =============================

my_system = SolarSystem.new([mercury, venus, earth, mars])

my_system.add_planet(jupiter)
my_system.add_planet(venus)

puts my_system.solarsystem_list_return

puts my_system.solarsystem_sentence_return

pluto = Planet.new(user_input)

puts pluto.each_planet_return

puts my_system.user_interaction

my_system.calc_distance_from_other("Venus", "Jupiter")

my_system.add_planet(pluto)

puts my_system.solarsystem_list_return
