
# Creates class Planet

class Planet        
  attr_reader :name
  attr_reader :mass
  attr_reader :diameter
  attr_reader :year_length
  attr_reader :distance_from_the_sun

  def initialize (name, mass, diameter, year_length, distance_from_the_sun)
    @name = name
    @mass = mass
    @diameter = diameter
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun

  end

# Returns Planet's attributes in an easy to read format
  def to_s
    return "#{@name}: mass = #{@mass}, diameter = #{@diameter}, year_length = #{@year_length}, distance_from_the_sun = #{@distance_from_the_sun}"
  end


# Calculates distance between planets.
  def distance_from_other_planet(other_planet)
    diff = @distance_from_the_sun - other_planet.distance_from_the_sun
    if diff >= 0
      return diff
    else
      return -1 * diff
    end
  end
  
end # End of class Planet

# Creates class Solarsystem
class Solarsystem
  attr_accessor :planets

  def initialize(planet_list)
    @planets = planet_list
  end

  def add (planet)
    @planets.push(planet)
  end

# This method iterates through @planets to find input planet. If finds, returns that planets' name.  
  def print_planet(planet_name) 
    found = false

    @planets.each do |pl|
      if planet_name == pl.name
        puts pl
        found = true
        break
      end
    end

    if !found
      puts "Such planet doesn't exist."
    end
  end

# List of all planets
  def list_planets
    planet_list = ""
    i = 0
    count = @planets.length
    while i < count
      planet = @planets[i]
      planet_list += "#{i+1}.#{planet}\n" # written in an easy to read format using "Planet" class' "to_s" method.
      i += 1
    end
    return planet_list
  end

end # end of class Solarsystem


# User input
def get_planet_from_user
  puts "Please enter a planet: "
  name = gets.chomp.to_s
  puts "Enter its mass: "
  mass = Float(gets.chomp)
  puts "Diameter of the planet: "
  diameter = Float(gets.chomp)
  puts "Time that takes to go around its star:  "
  year_length = Float(gets.chomp)
  puts "Distance from the sun: "
  distance_from_the_sun = Float(gets.chomp)
  return Planet.new(name, mass, diameter, year_length, distance_from_the_sun)
end

# Creates user interface 
def user_interface ()
  p1 = Planet.new("Saturn",11124124, 2226.464, 359.5, 11111111111)
  p2 = Planet.new("Mars",112124124, 454546.464, 9.5, 122222222)
  p3 = Planet.new("Jupiter",112124124, 1454.464, 736583.5, 333333333)
  p4 = Planet.new("Earth",112124124, 116.464, 29.5, 44444444444)
  p5 = Planet.new("Venus",55446124, 13236.464, 2323.5, 555555555555)
  all_planets = [p1, p2, p3, p4, p5]
  s1 = Solarsystem.new(all_planets)

  while true
    puts "Enter one of the following options (1 - 3):"
    puts "1. Create planet"
    puts "2. Query planet"
    puts "3. Exit"
    command = gets.chomp.to_i
    if command == 1
      new_planet = get_planet_from_user
      s1.add(new_planet)
    elsif command == 2
      puts "Enter a planet name to query:"
      planet_name = gets.chomp.to_s
      s1.print_planet(planet_name)
    elsif command == 3
      puts "You want to exit."
      break
    else
      puts "Invalid command."
    end
  end
end

user_interface()
