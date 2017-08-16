
# Solar System

# creates solar system class, which holds planets
class SolarSystem
  def initialize(planets)
    @planets = Array.new(planets)
  end

  # adds planet to array of planets
  def add_planet(planet)
    @planets.push(planet)
  end

  #returns list of planet names
  def planets_list
    @list = String.new
    @planets.each_with_index do |planet, i|
      @list += "#{i+1}. #{planet.name}\n"
    end
    return @list
  end

  # prints information on selected planet
  def planet_info(selection)
    return @planets[selection-1].planet_attributes
  end

  # finds the distance between two planets and returns information
  def distance_from_planet(selection1, selection2)
    planet1 = @planets[selection1-1]
    planet2 = @planets[selection2-1]
    return "#{planet1.name} and #{planet2.name} are #{(planet1.distance_from_sun-planet2.distance_from_sun).abs.round(2)} million miles from each other"
  end
end

# creates Planet class
class Planet
  attr_reader :name, :distance_from_sun

  def initialize(name, mass, year_length, diameter, number_of_moons, distance_from_sun)
    @name, @mass, @year_length, @diameter, @number_of_moons, @distance_from_sun = name, mass, year_length, diameter, number_of_moons, distance_from_sun
  end

  # method returns planet details
  def planet_attributes
    return "name: #{name}\nmass: #{@mass}\ndays to orbit star: #{@year_length}\ndiameter: #{@diameter}\nnumber of moons: #{@number_of_moons}\ndistance from sun: #{distance_from_sun} million miles"
  end
end

# method allows user to input planet details
def create_planet(name, mass, year_length, diameter, number_of_moons, distance_from_sun)
  return Planet.new(name, mass, year_length, diameter, number_of_moons, distance_from_sun)
end

# checks for valid user entry (i.e., version of yes or no)
def check_entry(answer)
  while answer != "YES" && answer != "Y" && answer!= "N" && answer != "NO"
    puts "Please enter yes or no"
    answer = gets.chomp.upcase
  end
  return answer
end

# adds planets to solar system
mercury = Planet.new("Mercury", "3.285 × 10^23 kg", "88 days", "3,032 mi", 0, 35.98)
venus = Planet.new("Venus", "4.867 × 10^24 kg", "225 days", "7,520.8 mi", 0, 67.24)
earth = Planet.new("Earth", "5.972 × 10^24 kg", "365 days", "7,917.5 mi", 1, 92.96)
ss = SolarSystem.new([mercury, venus])
ss.add_planet(earth)
mars = create_planet("Mars", "6.39 × 10^23 kg", "687 days", "4,212 mi", 2, 141.6)
ss.add_planet(mars)

# lists planets in solar system
puts "Here are the planets in the solar system\n#{ss.planets_list}"

# allows user to learn about a planet
loop do
  print "Want to learn about a planet? "
  answer = check_entry(gets.chomp.upcase)
  case answer
  when "Y", "YES"
    print "Select a planet to learn more (enter the number of the planet): "
    selection = gets.to_i
    puts ss.planet_info(selection)
  when "N", "NO"
    break
  end
end

# allows user to add a planet
loop do
  print "Would you like to add a planet? "
  answer = check_entry(gets.chomp.upcase)
  case answer
  when "Y", "YES"
    puts "OK please provide some information: "
    print "name: "
    name = gets.chomp
    print "mass: "
    mass = gets.chomp
    print "days to orbit star: "
    year_length = gets.chomp
    print "diameter: "
    diameter = gets.chomp
    print "number of moons: "
    number_of_moons = gets.chomp
    print "distance from sun: "
    distance_from_sun = gets.to_i
    new_planet = create_planet(name, mass, year_length, diameter, number_of_moons, distance_from_sun)
    ss.add_planet(new_planet)
    puts "Great! Here is our updated list of planets\n#{ss.planets_list}"
  when "N", "NO"
    break
  end
end

# allows user to find distance between two planets
loop do
  print "Want to know the distance between two planets? "
  answer = check_entry(gets.chomp.upcase)
  case answer
  when "Y", "YES"
    puts "Here are the planets in the solar system\n#{ss.planets_list}"
    puts "Select two planets (enter the number of planet 1, hit enter, and repeat for planet 2): "
    print "planet 1: "
    selection1 = gets.to_i
    print "planet 2: "
    selection2 = gets.to_i
    puts ss.distance_from_planet(selection1, selection2)
  when "N", "NO"
    break
  end
end

