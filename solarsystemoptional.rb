
# SolarSystem class
class SolarSystem
  # Generate reader methods
  attr_accessor :system, :age
# Creates an empty array
# Pushes argument into system array
def initialize(arg)
  @age = 2
  @system = []
  arg.each do |planet|
    @system.push (planet)
end

# Returns a list of planet names numbered by index
def planets
  list = ""
  i = 1
  @system.each do |planet|
    list.insert(-1, "#{i}. #{planet.planet_name} \n")
    i += 1
  end
    return list
end

# Adds a new planet to the system
def new_planet(new_info)
  @system.push(new_info)
end
# prints list of distances from other planets
def planets_distance(input_planet)
  @system.each do |planet|
    unless "#{input_planet.planet_name}" == "#{planet.planet_name}"
      if input_planet.distance_from_the_sun > planet.distance_from_the_sun
        pdistance = input_planet.distance_from_the_sun - planet.distance_from_the_sun
      else
        pdistance = planet.distance_from_the_sun - input_planet.distance_from_the_sun
      end
      puts "☾ #{input_planet.planet_name} is #{pdistance} million miles from #{planet.planet_name}☽"
    end
  end
  return
end

end # End of SolarSystem class

################
# Planet class
class Planet
  attr_reader :planet_name, :year_length, :distance_from_the_sun, :scout_name, :soldier_of

# Iterates through hash of planet info and assigns an instance variable to corresponding values
def initialize(planet_info)
  planet_info.each do |category, attributes|
      @planet_name = planet_info[:planet_name]
      @year_length = planet_info[:year_length]
      @distance_from_the_sun = planet_info[:distance_from_the_sun]
      @scout_name = planet_info[:scout_name]
      @soldier_of = planet_info[:soldier]
  end
end


# Returns a string of information for any given planet
def planet_data
  # pdata = "My planet is named #{@planet_name}.\nA year here takes #{@year_length} days.\nI am #{@distance_from_the_sun} million miles from the sun. \nMy sailor scout is #{scout_name}, she is the #{@soldier_of}.\n"
  # return pdata
  pdata = "Planet: #{@planet_name}\n" +
  ".  ✧　 * ✫  ⊹ A year here takes #{@year_length} days.\n" +".  ✧　 * ✫  ⊹ I am #{@distance_from_the_sun} million miles from the sun.\n" + ".  ✧　 * ✫  ⊹ My sailor scout is #{scout_name}.\n" + ".  ✧　 * ✫  ⊹ She is the #{@soldier_of}." + "\n "
  return pdata
end

end # End of planet class

# Creates 5 planets with 5 attributes
mercury = Planet.new(
   {
    planet_name: "mercury",
    year_length: 88,
    distance_from_the_sun: 36,
    scout_name: "Ami Mizuno",
    soldier: "Soldier of Water and Wisdom"
  })

venus = Planet.new (
{
    planet_name: "venus",
    year_length: 226,
    distance_from_the_sun: 64,
    scout_name: "Minako Aino",
    soldier: "Soldier of Love and Beauty"
  })

mars = Planet.new (
  {
    planet_name: "mars",
    year_length: 687,
    distance_from_the_sun: 141,
    scout_name: "Rei Hino",
    soldier: "Soldier of Fire and Passion"
  })

  jupiter = Planet.new (
  {
    planet_name: "jupiter",
    year_length: 4380,
    distance_from_the_sun: 484,
    scout_name: "Makoto Kino",
    soldier: "Soldier of Thunder and Courage"
  })

  # Creates a new solar system with an array of the 5 planets
  senshi = SolarSystem.new ([mercury, venus, mars, jupiter])

  # # Prints a list of planets
  # puts senshi.planets
  #
  # # Prints information on the planet mercury
  # puts mercury.planet_data

  saturn = Planet.new(

  {
      planet_name: "saturn",
      year_length: 226,
      distance_from_the_sun: 64,
      scout_name: "Hotaru Tomoe",
      soldier: "Soldier of Destruction and Silence"
    })

senshi.new_planet(saturn)


puts "\n.  ✧　 * ✫  ⊹ Welcome to the Sailor Senshi System.  ✧　 * ✫  ⊹ "
puts ".  ✧　 * ✫  ⊹ Please type in a planet to learn more ✧　 * ✫  ⊹ "
puts ".  ✧　 * ✫  ⊹ Or type NEW to make one of your own!.  ✧　 * ✫  ⊹ \n"
puts senshi.planets
print ".  ✧　 * ✫  ⊹ "

user_input = gets.chomp

# Gets input from user until they enter stop
# If they enter new, creates a new planet based on user input and adds it to the system
# If they enter name of planet, it will print data
until user_input == "stop"
  if "#{user_input}" == "new"
    print "\n✫new planet name: "
    new_name = gets.chomp
    print "\n*year length in days: "
    new_year = gets.chomp.to_i
    print "\n*distance from sun in millions of miles: "
    new_distance = gets.chomp.to_i
    print "\n⊹scout name: "
    new_scout = gets.chomp
    print "\n✫soldier of: "
    new_soldier = "Soldier of " + gets.chomp

    user_planet = Planet.new (
    {
      planet_name: "#{new_name}",
      year_length: new_year,
      distance_from_the_sun: new_distance,
      scout_name: "#{new_scout}",
      soldier: "#{new_soldier}"
    })
    senshi.new_planet(user_planet)
    print "\nthanks! user planet is saved.\n"
  elsif
    senshi.system.each do |planet|
      if "#{user_input}" == "#{planet.planet_name}"
        puts planet.planet_data
        puts senshi.planets_distance(planet)
      elsif user_input == "stop"
      elsif user_input == "new"
        break
      else
      end
    end
  else
  end
  puts "\n.  ✧　 * ✫  ⊹ Please type in a planet to learn more ✧　 * ✫  ⊹ "
  puts ".  ✧　 * ✫  ⊹ Or type NEW to make one of your own!.  ✧　 * ✫  ⊹ \n"
  puts senshi.planets
  print "\n.  ✧　 * ✫  ⊹ "
  user_input = gets.chomp
end
end
