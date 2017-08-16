class SolarSystem

  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  def add_planets(planet)
    @planets << planet
  end

  def list_planets
    @planets.each do |planet|
      planet
    end
  end
end #end of SolarSystem class

class Planet

  attr_reader :name, :color, :size, :distance, :temp

  def initialize(name, color, size, distance, temp)
    @name = name
    @color = color
    @size = size
    @distance = distance
    @temp = temp
  end

  def list_characteristics
    return "#{@name} is #{@color} and is #{@size} in stature. It is #{@distance} from the sun with a #{temp} climate."
  end
end #end of Planets class


venus = Planet.new("Venus", "pink", "little", "60 million miles", "cold")
mars = Planet.new("Mars", "white", "little", "50 million miles", "warm")
mercury = Planet.new("Mercury", "orange", "medium", "40 million miles", "hot")
saturn = Planet.new("Saturn", "blue", "huge", "10 million miles", "cold")

all_planets = [venus, mars, mercury]

solar = SolarSystem.new(all_planets)
solar.add_planets(saturn)


puts "What planet are you interested in: Mars, Mercury, Saturn, or Venus?"
user_selection = gets.chomp.downcase
case user_selection
when "mars"
  puts mars.list_characteristics
when "venus"
  puts venus.list_characteristics
when "mercury"
  puts mercury.list_characteristics
when "saturn"
  puts saturn.list_characteristics
else
  puts "I don't know about that planet. You should add the planet's information."
  print "Enter the planet's name: "
  name = gets.chomp.to_s
  print "Enter the planet's color: "
  color = gets.chomp.to_s
  print "Enter the planet's size: "
  size = gets.chomp.to_s
  print "Enter the planet's distance from the sun: "
  distance = gets.chomp.to_s
  print "Enter the planet's climate: "
  temp = gets.chomp.to_s

  user_planet = Planet.new(name, color, size, distance, temp)
  solar.add_planets(user_planet)

  puts "I didn't you know that #{user_planet.list_characteristics}"
  puts "Thanks for the info!"
end
