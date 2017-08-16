# Define the class Solar System
class SolarSystem
  attr_reader :planets, :age, :planet_names

  # Initialize @planets as an array of planet instances
  def initialize(planets)
    @planets = planets
    @num_of_planets = @planets.length
    @age = 4600 #in million of years
    @planet_names = planet_name_array
  end

  def num_of_planets
    @num_of_planets = @planets.length
  end

  # Method to add planets to the array. Added planets should be objects.
  def add_planet(planet_to_add)
    @planets << planet_to_add
    @num_of_planets = @planets.length
    @planet_names = planet_name_array
  end

  #Create an array of planet names
  def planet_name_array
    @planet_names = []
    @planets.each do |planet_object|
      planet_name = planet_object.name.downcase
      @planet_names << planet_name
    end
    return @planet_names
  end

  #Generates a list of planet names
  def list_planets
    planet_list = ""
    i = 1
    @planet_names.each do |planet_name|
      planet_list << "#{i}. #{planet_name.capitalize}\n"
      i += 1
    end
    return planet_list
  end

  # This method finds the distance assuming they are in a straight line out from the sun.
  def find_distance_between_planets(planet_1, planet_2)
    information_hash = {}
    information_hash[:planet_1] = @planets[planet_1.to_i].name
    information_hash[:planet_2] = @planets[planet_2.to_i].name
    distance = @planets[planet_1.to_i].distance_from_sun - @planets[planet_2.to_i].distance_from_sun
    information_hash[:distance] = distance.abs

    return information_hash
  end
end #End of Solar System class

class Planet

  attr_reader :name, :named_for, :diameter, :distance_from_sun, :type, :year_length, :star_system, :color, :day

  def initialize(attributes = {})
    @name = attributes[:name]
    @named_for = attributes[:named_for] #meaning of name
    @diameter = attributes[:diameter] #measured in km
    @distance_from_sun = attributes[:distance_from_sun] #measured in million km
    @type = attributes[:type]
    @year_length = attributes[:year_length] #measured in Earth years
    @star_system = attributes[:star_system]
    @color = attributes[:color]
    @day = attributes[:day]
  end

  def return_attributes
    planet_summary = "
    Name: #{@name}
    Meaning of Name: #{@named_for}
    Diameter: #{@diameter}
    Celestial Object: #{@type}
    Color: #{@color}
    Length of Year (in Earth years): #{@year_length}
    Distance from the sun: #{@distance_from_sun.to_s} million km
    Star System: #{@star_system} System
    Length of day: #{@day}"

    return planet_summary
  end
end #End of Planet class

# Initial message used to let the determine how they want to interact with the program.
def get_choice
  puts "\nThank you for using our Solar System Explorer! Here are your options:
    (A) Add a planet to the list
    (B) View a planet
    (C) Find distance between two planets
    (D) Find the local age of a planet
    (E) Exit the program"
  print "\nPlease select a letter: "
  choice = gets.chomp.upcase
  return choice
end

# If the user enters a planet name the first time, it will be accepted. If the user does not enter a correct number or name it will prompt them to enter an existing number until they do.
def valid_entry(solar_system)
  print "Select a planet: "
  planet_number = gets.chomp

  # if user enters a planet name instead of number, that name will be used to find the index value.
  if solar_system.planet_names.include?(planet_number.downcase)
    planet_number = solar_system.planet_names.index(planet_number.downcase)
    return planet_number.to_i
  end

  # If user does not enter a valid name or number they will be prompted to enter again.
  until (planet_number.to_i.to_s == planet_number) && (planet_number.to_i <= solar_system.num_of_planets && planet_number.to_i>0)
    print "Please select a valid number to represent a planet: "
    planet_number = gets.chomp
  end
  planet_number = planet_number.to_i - 1
  return planet_number
end

#(Choice A)
def view_planet_summary(solar_system)
  puts "Choose a planet to view some if it's information: "
  puts solar_system.list_planets
  puts
  planet_chosen = valid_entry(solar_system)
  puts solar_system.planets[planet_chosen].return_attributes
end

#(Choice B)
def create_new_planet
  planet = {}
  planet[:name]= ""
  while planet[:name] == ""
    puts "Please enter the name of the planet you would like to add: "
    planet[:name] = gets.chomp.capitalize
  end
  puts "Please provide the following attributes. (If any are unkown please type 'unknown') "
  print "Meaning of planet name: "
  planet[:named_for] = gets.chomp
  print "Diameter(in km): "
  planet[:diameter] = gets.chomp
  print "Distance from the Sun (or it's star) (units: million km): "
  planet[:distance_from_sun] = gets.chomp
  print "Type of Celestial Object: "
  planet[:type] = gets.chomp
  print "Length of Year (units: Earth years): "
  planet[:year_length] = gets.chomp
  print "Star System: "
  planet[:star_system] = gets.chomp
  print "Color: "
  planet[:color] = gets.chomp
  print "Length of Day: "
  planet[:day] = gets.chomp
  planet_object = Planet.new(planet)
  return planet_object
end

#(Choice C)
def view_distance_between_planets(solar_system)
  puts "Choose two planets from the following list to find the distance between them:"
  puts solar_system.list_planets
  puts
  print "Planet 1: "
  planet_1 = valid_entry(solar_system)
  print "Planet 2: "
  planet_2 = valid_entry(solar_system)
  information_hash =  solar_system.find_distance_between_planets(planet_1, planet_2)
  puts "The distance between #{information_hash[:planet_1]} and #{information_hash[:planet_2]} is: "
  puts "#{information_hash[:distance]} million km"
end

#(Choice D)
def view_local_age_of_planet(solar_system)
  puts "Choose a planet to determine it's local age: "
  puts solar_system.list_planets
  puts
  planet_chosen = valid_entry(solar_system).to_i
  local_age = solar_system.age / solar_system.planets[planet_chosen].year_length
  puts format("The local age of #{solar_system.planets[planet_chosen].name} is %.2f million years", local_age)
end

#(Choice E)
def leave_program
  puts "Thank you! Have a nice day!"
  exit
end

# Pre-populated solar system
# distance from sun is represented in million km.
planets_in_ss = [
{
  name: "Mercury",
  named_for: "Messenger of the Roman gods",
  diameter: 4_878,
  color: "gray",
  type: "planet",
  year_length: 0.241,
  star_system: "Solar",
  day: "58.6 Earth days",
  distance_from_sun: 57.9
},
{
  name: "Venus",
  named_for: "Roman goddess of love and beauty",
  diameter: 12_104,
  color: "yellow",
  type: "planet",
  year_length: 0.615,
  star_system: "Solar",
  day: "241 Earth days",
  distance_from_sun: 108.2
},
{
  name: "Earth",
  diameter: 12_760,
  color: "blue",
  type: "planet",
  year_length: 1,
  star_system: "Solar",
  day: "24 hours",
  distance_from_sun: 149.6
},
{
  name: "Mars",
  named_for: "Roman god of war",
  diameter: 6_787,
  color: "red",
  type: "planet",
  year_length: 1.88,
  star_system: "Solar",
  day: "1 Earth day",
  distance_from_sun: 227.9
},
{
  name: "Jupiter",
  named_for: "Ruler of the Roman gods",
  diameter: 139_822,
  color: "orange and white",
  type: "planet",
  year_length: 11.86,
  star_system: "Solar",
  day: "9.8 Earth hours",
  distance_from_sun: 778.3
},
{
  name: "Saturn",
  named_for: "Roman god of agriculture",
  diameter: 120_500,
  color: "pale gold",
  type: "planet",
  year_length: 29.46,
  star_system: "Solar",
  day: "10.5 Earth hours",
  distance_from_sun: 1427
},
{
  name: "Uranus",
  named_for: "Personification of heaven in ancient myth",
  diameter: 51_120,
  color: "pale blue",
  type: "planet",
  year_length: 84.01,
  star_system: "Solar",
  day: "18 earth hours",
  distance_from_sun: 2871
},
{
  name: "Neptune",
  named_for: "Roman god of water",
  diameter: 49_530,
  color: "pale blue",
  type: "dwarf-planet",
  year_length: 164.79,
  star_system: "Solar",
  day: "60,200 earth days",
  distance_from_sun: 4497
},
{
  name: "Pluto",
  named_for: "Roman god of the underworld, Hades",
  diameter: 2_301,
  color: "red",
  type: "planet",
  year_length: 248.59,
  star_system: "Solar",
  day: "6.4 earth days",
  distance_from_sun: 5913
},
]

# Creates an array of planet objects based on the planet hashes defined above.
solar_system_planets = []
planets_in_ss.each do |planet_hash|
  solar_system_planets << Planet.new(planet_hash)
end

#Creates a new solar system instance based on the planet instances
solar_system_object = SolarSystem.new(solar_system_planets)

# User interface
while true
  choice = get_choice
  case choice
  when "A"
    new_planet = create_new_planet
    solar_system_object.add_planet(new_planet)
  when "B"
    view_planet_summary(solar_system_object)
  when "C"
    view_distance_between_planets(solar_system_object)
  when "D"
    view_local_age_of_planet(solar_system_object)
  when "E"
    leave_program
  else
    puts "\nI'm sorry that's not a valid selection. Please try again."
  end
end
#############################################
