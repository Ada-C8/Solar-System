class Planet
  attr_accessor :name, :moons, :orbit, :distance_from_sun
  # initializes attributes of each instance of a planet
def initialize(planet_hash)
    @name = planet_hash[:name]
    @moons = planet_hash[:moons]
    @orbit = planet_hash[:orbit]
    @distance_from_sun = planet_hash[:distance_from_sun]
  end

  # prints information about a specific planet
def print_info
  puts "Here are some basic facts about #{@name}: It has #{@moons} moon(s),\norbits around the sun in #{@orbit} Earth days, and is #{@distance_from_sun}\n million miles away from the Sun."
end

def distance_from(planet2)
  (@distance_from_sun - planet2.distance_from_sun).abs
end

def add_planets(planet)
    planet.each do |planet|
    @planets << planet
    end #ends do loop
  end #ends add planets

end #ends Planet

planet_info = [
  mercury = Planet.new(
  { name: "Mercury",
    moons: 0,
    orbit: 88,
    distance_from_sun: 58
  }),
  venus = Planet.new(
  {
    name: "Venus",
    moons: 0,
    orbit: 225,
    distance_from_sun: 108
  }),
  earth = Planet.new(
  {
    name: "Earth",
    moons: 1,
    orbit: 365,
    distance_from_sun: 150
  }),
  mars = Planet.new(
  {
    name: "Mars",
    moons: 2,
    orbit: 689,
    distance_from_sun: 230
  }),
  jupiter = Planet.new({
    name: "Jupiter",
    moons: 63,
    orbit: 4333,
    distance_from_sun: 778
  }),
  saturn = Planet.new({
    name: "Saturn",
    moons: 62,
    orbit: 10759,
    distance_from_sun: 1400
  }),
uranus = Planet.new({
    name: "Uranus",
    moons: 27,
    orbit: 30689,
    distance_from_sun:3000
  }),
  neptune = Planet.new({
    name: "Neptune",
    moons: 14,
    orbit: 60182,
    distance_from_sun: 4500
  }),
  pluto = Planet.new({
    name: "Pluto (you'll always be a planet to me)",
    moons: 5,
    orbit: 248,
    distance_from_sun: 3600
  })
]


class Solar_System
  attr_reader :name
  attr_accessor :planets #making planets accessible to Solar_System

  def initialize(name,distance)
    @name = name
    @planets = []
    @distance = distance
  end

def add_planets(planet)
    planet.each do |planet|
    @planets << planet
    end #ends do loop
  end #ends add planets

  def add_planet(planet)
    @planets.push(planet)
  end

  def distance_from(second_planet)
    (@distance_from_sun - second_planet.distance_from_sun).abs
  end
end #ends Solar_System

ss = Solar_System.new("ss",50000000) #fake number
ss.add_planets(planet_info)

def user_adds_planets(ss)
puts "What's the planet name?"
name = gets.chomp.capitalize
puts "How many moons does it have? Enter 0 for none."
moons = gets.chomp.to_i
puts "Add the number if days it takes for it to orbit around the Sun: "
orbit = gets.chomp.to_i
puts "How far is this planet from the Sun? "
distance_from_sun = gets.chomp.to_i
ss.add_planets(
  Planet.new(
    {
      name: name,
      moons:moons,
      distance_from_sun: distance_from_sun,
      orbit: orbit
    }
  )
)
return ss
end

# testing to see if it prints



puts "Planets:"
planet_info.length.times { |n| puts "#{n + 1}. " + planet_info[n].name }

while true
  puts "Select the number of the planet you would like to know about: "
  selection = gets.chomp.to_i
  # creates an instance of a planet
  planet = (planet_info[selection - 1])
  # prints information about a selected planet to get the index right
  planet.print_info
  puts "\nWould you like to learn more? (y/n)\n"
  answer = gets.chomp
  if answer != "y"
  puts "\n\Thanks for playing, you learn something old every day!\n "
break
end
end

while true
puts "Would you like to compare two planets?(y/n)"
selection = gets.chomp.downcase
# if selection != "y"
#   puts "OK, but I spent a lot of time working on giving you this option! :-("
# #   break
# end
puts "Select the numbers of the planets you would like to compare: "
puts "First planet: "
first= gets.chomp.to_i
puts "Second planet: "
second = gets.chomp.to_i
# calculates the distance between the two planets added to the @planets array
# first-1 selects the index number , since they start from zero
planets_distance = ss.planets[first - 1].distance_from(ss.planets[second - 1])
puts "The distance between #{ss.planets[first - 1].name} and #{ss.planets[second - 1].name} is #{planets_distance} million km.
This is, of course, inaccurate."
puts "Would you like to learn more?(y/n)"
answer = gets.chomp.downcase
if answer != "y"
puts "\n\ OK, BYE!"
break
end
end


#===========================READ PLEASE===========================
#The following code prompts for name, moons, orbit and distance_from_sun
# it WILL NOT PRINT , I don't know why
# can we PLEASE figure it out together. I spend over 15 hours on this.


# puts "Would you like to add a planet?(y/n)"
# selection = gets.chomp.downcase
# if selection == "y"
# ss = user_adds_planets(ss)
# puts "#{ss.planets[-1].name.capitalize} has been added to the solar system!"
# puts "which brings the total number of planets to #{planet_info.length}. Nicely done!"
# else
#   puts "OK, BYE!"
# end
#would like to know how to access things in Class
#how to use the print_info
