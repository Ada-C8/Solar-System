# Create a SolarSystem class with an @planets instance variable.
class Solar_system
  attr_accessor :planets

  def initialize(planets)
    # @planets = ["hoth", "mars", "jupiter"]
    @planets = planets
  end

# Create a method to add a planet to the list.
  def add_planet(name, radius, length, dist, yr_length, mass)
    @planets << {name: name, radius: radius, length_of_day: length, distance_from_the_sun: dist, year_length: yr_length, mass: mass}
  end

# Create a method which will return not print a list of the planets as a String in this style:
  def list
    list_string = ""
    @planets.each_with_index do |planet, i|
      list_string << "#{i+1}.Name:#{planet[:name]}\n  Radius:#{planet[:radius]}\n  Length of Day: #{planet[planet[:length_of_day]]}\n  Distance from Sun: #{planet[:distance_from_the_sun]}\n  Year Length: #{planet[:year_length]}\n  Mass: #{planet[:mass]}\n\n"
    end
    return list_string
  end
end

# Instead of Strings for planets, modify SolarSystem's initialize method to take a list of hashes where each planet is sent as a hash with at least 5 attributes.

# {name: "", radius: "", length_of_day: "", distance_from_the_sun: "", year_length: "", mass: ""}

# Array of hashes containing planet attributes information
test_system = Solar_system.new(
  [
    {name: "Mercury", radius: "1,516 mi", length_of_day: "58d 15h 30m", distance_from_the_sun: "35.98 million mi", year_length: "88 days", mass: "3234324"},
    {name: "Venus", radius: "3,760 mi", length_of_day: "116d 18h 0m", distance_from_the_sun: "67.24 million mi", year_length: "225 days", mass: "34234324"},
    {name: "Earth", radius: "3,959 mi", length_of_day: "0d 24h 56m", distance_from_the_sun: "92.96 million mi", year_length: "365 days", mass: "343423423"},
    {name: "Mars", radius: "2,106 mi", length_of_day: "1d 0h 40m", distance_from_the_sun: "141.6 million mi", year_length: "687 days", mass: "623423423"}, {name: "Jupiter", radius: "43,441 mi", length_of_day: "0d 9h 56m", distance_from_the_sun: "483.8 million mi", year_length: "12 years", mass: "23432"}
  ]
)

# Write code to test your SolarSystem
test_system.add_planet("test","test1","test2","test3","test4","test5")
puts test_system.planets[0][:name]
puts "----"
puts  test_system.list
