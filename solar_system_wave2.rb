# Create a Planet class which will represent a planet.
  #  Add an initialize method which takes several arguments and uses them to set the class' instance variables.
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
    return "%-20s%-20s\n%-20s%-20s\n%-20s%-20s\n" % ["Name: #{@name}", "Distance from the Sun: #{@dist_sun}", "Mass: #{@mass}", "Length of Day: #{@length_of_day}","Radius: #{@radius}" , "Year Length: #{@yr_length}"]
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

  # def add_planet(name, radius, length, dist, yr_length, mass)
  #   @planets << {name: name, radius: radius, length_of_day: length, distance_from_the_sun: dist, year_length: yr_length, mass: mass}
  # end

  def list
    list_string = ""
    @planets.each_with_index do |planet, i|
      list_string << "#{i+1}.\n#{planet.planet_info}\n"
    end
    return list_string
  end
end

# pre-populated planet info
earth = Planets.new("Earth","3,959 mi", "0d 24h 56m","92.96 million mi", "365 days","343423423")

venus = Planets.new("Venus","3,760 mi", "116d 18h 0m", "67.24 million mi", "225 days","34234324")

mercury = Planets.new("Mercury", "1,516 mi", "58d 15h 30m","35.98 million mi", "88 days","3234324")

mars = Planets.new("Mars", "2,106 mi", "1d 0h 40m", "141.6 million mi", "687 days", "623423423")

jupiter = Planets.new("Jupiter","43,441 mi","0d 9h 56m","483.8 million mi","12 years","23432")

my_solar_system = Solar_system.new([earth, mercury, venus, mars, jupiter])
puts my_solar_system.list
