# Create a Planet class which will represent a planet.
  # Add an initialize method which takes several arguments and uses them to set the class' instance variables.
  # Create a method that returns the Planet's attributes in an easy to read fashion.
  # Create reader methods to give a user access to read the instance variables.
#

class Planets
  attr_accessor :name, :radius, :length_of_day, :dist_sun, :yr_length, :mass

  def initialize(name, radius, length_of_day, dist_sun, yr_length, mass)
    @name = name
    @radius = radius
    @length_of_day = length_of_day
    @dist_sun = dist_sun
    @yr_length = yr_length
    @mass = mass
  end

  def planet_info
    return "Name: #{@name}\nDistance from Sun: #{@dist_sun}\nMass: #{@mass}\nLength of Day: #{@length_of_day}\nRadius: #{@radius}\nYear Length: #{@yr_length}\n"

    # return "%-30s%-30s\n%-30s%-30s\n%-30s%-30s\n" % ["Name: #{@name}", "Distance from Sun: #{@dist_sun}", "Mass: #{@mass}", "Length of Day: #{@length_of_day}","Radius: #{@radius}" , "Year Length: #{@yr_length}"]
  end
end

# Make your SolarSystem class take an array of Planets instead of hashes.
  # When printing the planet list or planet details, it should call the corresponding method in Planet.
#
class Solar_system
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  def add_planet(user_planet)
    @planets << user_planet
  end
  # def add_planet(name, radius, length, dist, yr_length, mass)
  #   @planets << {name: name, radius: radius, length_of_day: length, distance_from_the_sun: dist, year_length: yr_length, mass: mass}
  # end

  # Method to call and output all of the planets in the solar system in a formatted numbered list
  def list_planet_names
    list_string = ""
    @planets.each_with_index do |planet, i|
      list_string << "#{i+1}. #{planet.name}\n"
    end
    return list_string
  end

  # method to format and output a list of all of the planet info for all of the planets in the whole solar system
  def all_planet_info
    list_string = ""
    @planets.each_with_index do |planet, i|
      list_string << "#{i+1}.\n#{planet.planet_info}\n"
    end
    return list_string
  end

  def single_planet_info(index)
    return @planets[index].planet_info
  end
end

# Create a method, outside any class, which creates a planet from user input
def create_user_planet
  puts "What do you call your planet?:"
  user_planet_name = gets.chomp

  puts "What is the radius of your planet?:"
  user_planet_radius = gets.chomp

  puts "What is the length of day for #{user_planet_name}?:"
  user_planet_lod = gets.chomp

  puts "How far away is #{user_planet_name} from the sun?:"
  user_planet_distance_sun = gets.chomp

  puts "What is the year length?:"
  user_planet_year_length = gets.chomp


  puts "What is the mass for #{user_planet_name}?:"
  user_planet_mass = gets.chomp

  user_planet = Planets.new(user_planet_name, user_planet_radius, user_planet_lod, user_planet_distance_sun, user_planet_year_length, user_planet_mass)
return user_planet
end

# method to check if something is an integer. Returns match value if an interget or nil if it isn't and integer
def integer?(obj)
  obj = obj.to_s unless obj.is_a? String
  /^\d+$/.match obj
end

def get_user_num
  number = ''
  puts "Which planet do you want more information on? Please enter a number that corresponds to the planets list above."

  loop do
    number = gets.chomp
    break if integer?(number)
    puts "That is not a number! Try again."
  end
  number = number.to_i

  # loop do
  #   number = number.to_i
  #   break if number > num_planets
  #   puts "That is not a valid number! Try again."
  # end

  return number
end

# def validate(num_planets)
#   loop do
#     number = number.to_i
#     break if number > num_planets
#     puts "That is not a valid number! Try again."
#   end
#   return number
# end

earth = Planets.new("Earth","3,959 mi", "0d 24h 56m","92.96 million mi", "365 days","343423423")

venus = Planets.new("Venus","3,760 mi", "116d 18h 0m", "67.24 million mi", "225 days","34234324")

mercury = Planets.new("Mercury", "1,516 mi", "58d 15h 30m","35.98 million mi", "88 days","3234324")

mars = Planets.new("Mars", "2,106 mi", "1d 0h 40m", "141.6 million mi", "687 days", "623423423")

jupiter = Planets.new("Jupiter","43,441 mi","0d 9h 56m","483.8 million mi","12 years","23432")

my_solar_system = Solar_system.new([earth, venus, mercury, mars, jupiter])
# my_solar_system.add_planet(create_user_planet)

puts "Planets are sooo cool! Check out this list of planets we have information on."
puts
puts "-" * 20
puts my_solar_system.list_planet_names
puts "-" * 20
puts
puts my_solar_system.single_planet_info((get_user_num() - 1))

puts "Would you like to add your own planet?"
user_add_planet = gets.chomp.downcase
hold = my_solar_system.planets.length.to_i

if user_add_planet == "y" || user_add_planet == "y"
  create_user_planet
  puts my_solar_system.planets.length.to_i
  puts my_solar_system.single_planet_info(5)
else
  puts "Bummer. Planets are great!"
end




# take user input and output planet info - allow user input in string or numbers, verify user input, kick back when the
# user pick one, multiple or all planets
# allow the user to pick if they want to add a planet or pick planet infor
# make a method that doesn't print out all of planets just the one the user selects
# fix planet mass data attribute
