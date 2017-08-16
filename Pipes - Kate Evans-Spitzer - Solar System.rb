#########################
###### DEFINITIONS ######
#########################


class SolarSystem

  attr_reader :system_name, :num_planets, :planets, :planet_list

  def initialize(name, planets) 
    @system_name = name.to_s
    @planets = {}
    planets.each {|new_planet| @planets[new_planet.name] = new_planet}
    @num_planets = @planets.length
    # puts "@planets['Mars'] looks like: #{@planets["Mars"]}"            # => #<Planet:0x007fcefb89cd90>
    # puts "@planets['Mars'].name looks like: #{@planets["Mars"].name}"  # => Mars
  end

  def add_planet(*planet)         # Adds one or more Planet objects to solar system
    planet.each {|new_planet| @planets[new_planet.name] = new_planet}
    @num_planets = @planets.length
  end

  def list
    output = ""
    @planet_list = {}
    @planets.each_with_index do |planet, i|
      output += "%d. %s\n" % [i+1, planet[1].name]
      @planet_list[i] = planet
    end
    return output
  end

  def distance_between(first, second)

    if first.class == String                    # DRY???
      first = @planets[first]
    elsif first.class == Planet
    else
      return "Invalid Input: #{first}"
    end

    if second.class == String
      second = @planets[second]
    elsif second.class == Planet
    else
      return "Invalid Input: #{second}"
    end

    # [first,second].map! do |arg|          # this doesn't work - doesn't actually change arguments (why not???)
    #   if arg.class == String
    #     @planets[arg]
    #   elsif arg.class == Planet
    #     arg
    #   else
    #     return "Invalid Input: #{arg}"
    #   end
    # end

    return (first.distance-second.distance).abs.round(2)
  end

end # end of SolarSystem class


class Planet

  attr_reader :name, :year_length, :distance, :radius, :gravity, :type

  def initialize(name, year, distance, radius, gravity, type)
    @name = name
    @year_length = year
    @distance = distance
    @radius = radius
    @gravity = gravity
    @type = type
  end

  def info
    output = ""
    output += "Information about #{@name}:\n"
    output += "Year Length: #{@year_length.round(2)} solar days\n"
    output += "Distance from Sun: #{@distance.round(2)} AU\n"
    output += "Mean Radius: #{radius.round(2)} km\n"
    output += "Surface Gravity: #{@gravity.round(2)} g\n"
    output += "Planet Type: #{@type}"
  end

end # end of Planet class


def learn_about_systems(system)   # Display solar system, allow user to select a planet to learn more about
  puts "Hello! I hear you want to learn about #{system.system_name}!"
  puts "Planets in this system:"
  puts system.list
  choice = nil
  puts "\nPlease enter the number of the planet you'd like to learn about: "
  puts "(Or type EXIT to exit)"

  until choice == "EXIT"

    choice = get_planet_number(system.num_planets)
    puts "\n"

    if choice == "LIST"
      puts system.list
    elsif choice == "EXIT"
      break
    else
      puts system.planet_list[choice][1].info
    end

    puts "\nEnter another planet number to keep learning: "
    puts "(Or type EXIT to exit, or LIST to see the list again)"

  end

  puts "Okay, bye!"
  return

end

def play_god                    # User creates own planet
  puts "Let's build our own planet!"

  puts "Name the planet:"
  name = gets.chomp

  year = validate_planet_number("How many days long is this planet's year?")

  distance = validate_planet_number("How many Astronomical Units away from the sun is this planet? (Earth = 1 AU)")

  radius = validate_planet_number("How many kilometers is it to the center of this planet?")

  gravity = validate_planet_number("How many g's is the surface gravity of your planet? (Earth = 1 g)")

  puts "What type of planet is it? (e.g. Terrestrial, Gas Giant, Dwarf Planet, etc)"
  type = gets.chomp

  puts "You're done creating #{name}!"
  return Planet.new(name, year, distance, radius, gravity, type)
end

def get_planet_number(length)     # Take user input to select a planet (index) from a solar system, and confirm it corresponds to a number (or, user can enter EXIT or LIST)
  num = nil
  while num == nil || num > length
    begin
      print "Planet number: "
      input = gets.chomp
      if input.upcase == "EXIT"
        return "EXIT"
      elsif input.upcase == "LIST"
        return "LIST"
      end
      num = Integer(input)
      if num > length
        puts "Invalid Input: Number does not correspond to planet. Please try again."
      end
    rescue
      puts "Invalid Input: Please enter EXIT, LIST, or a number."
    end
  end
  return num - 1
end

def validate_planet_number(question)  # Take and validate numerical user input when creating a planet
  puts question
  input = nil
  while input == nil
    begin
      input = gets.chomp
      input = Float(input)
    rescue
      puts "Invalid Input: Please enter a number."
      input = nil
    end
  end
  return input
end

def line_break        # Visually divide output
  puts "*"*20
end


##########################
###### TESTING CODE ######
##########################



line_break

# Creating planets & solar system
# (Division in definitions is to average Aphelion & Perihelion to find average distance from sun)

mercury = Planet.new("Mercury", 87.969, (0.307499+0.466697)/2, 2439.7, 0.38, 'terrestrial')
venus = Planet.new("Venus", 224.701, (0.718440+0.728213)/2, 6051.8, 0.904, 'terrestrial')
earth = Planet.new("Earth", 365.256363004, 1.00, 6371.0, 1, 'terrestrial')
mars = Planet.new("Mars", 686.971, (1.3814+1.6660)/2, 3389.5, 0.376, 'terrestrial')
jupiter = Planet.new("Jupiter", 4332.59, (4.95029+5.45492)/2, 69911, 2.528, 'gas giant')
saturn = Planet.new("Saturn", 10759.22, (9.024+10.086)/2, 58232, 1.065, 'gas giant')
uranus = Planet.new("Uranus", 30688.5, (18.33+20.11)/2, 25362, 0.886, 'ice giant')
neptune = Planet.new("Neptune", 60182, (29.81+30.33)/2, 24622, 1.14, 'ice giant')

pluto = Planet.new("Pluto", 90560, (29.658+49.305)/2, 1189.9, 0.063, 'dwarf planet')

sol = SolarSystem.new("Our Solar System", [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune])

puts sol.list        # Printing out list of planets

line_break

puts "Adding #{pluto.name}"
sol.add_planet(pluto)        # Adding a planet

line_break

puts sol.list      # Printing updated list of planets

line_break

learn_about_systems(sol)      # Learning about the planets in the solar system

line_break

custom = play_god      # Creating a new planet

line_break

puts custom.info      # Printing out the information about our new planet

line_break

# Calculating distance between two planets (can either input names of planets or planets themselves)
puts "Finding distance by name (String) of planets within Solar System object:"
puts "The distance between Mars and Venus is #{sol.distance_between('Mars','Venus')} AU"

puts "\nFinding distance by Planet objects:"
puts "The distance between Mars and Venus is #{sol.distance_between(mars,venus)} AU"
