
# Primary Requirements
#
# Create an interface where the user can interact with the solar system and be able to select a planet and view information about it.
# Allow your user to add their own planet.
#


class Planet
  attr_accessor :name, :distance, :age, :inhabitants, :color

  def initialize(name,distance,age,inhabitants,color)
    @name = name
    @distance = distance
    @age = age
    @inhabitants = inhabitants
    @color = color
  end

  def to_string
    return "#{@name}: \n Distance from the Sun: #{@distance} light years\n Age: #{@age} space years \n Inhabitants: #{@inhabitants}\n Color: #{@color}\n\n"
  end
end

class SolarSystem
  attr_accessor :planets
  def initialize(planets)
    @planets = planets
  end

  def planet_add(planet)
    @planets.push planet
    return @planet
  end

  def planet_list
    num = 0
    planet_list = ""
    @planets.each do |planet|
      num += 1
      planet_list += "#{num}. #{planet.to_string}\n"
    end
    return planet_list
  end

  def planet_names
    num = 0
    planet_names = ""
    @planets.each do |planet|
      num += 1
      planet_names += "#{num}. #{planet.name}\n"
    end
    return planet_names
  end

  # # New Code attempt - does not work ##
    # def user_adds_planet
    #   add_planet_hash = {name: nil, age: 0, distance: 0, inhabitants: nil, color: nil}
    #   return new_planet_name = Planet.new(add_planet_hash[:name], add_planet_hash[:age], add_planet_hash[:distance], add_planet_hash[:inhabitants], add_planet_hash[:color])
    #   solar_system.planet_add(new_planet_name)
    #   solar_system.planet_add(new_planet_name)
    #end




  ## Good code ##
  def choice(planet_choice)
    return @planets[planet_choice].to_string
  end

  #New code attempt#
  # def choice(planet_choice)
  #   if planet_choice >= 1 && planet_choice <= solar_system.planet
  #       return solar_system.planet_names(planet_choice)
  #   else
  #     "Invalid answer. Please select a planet number from the planets list."
  #     planet_choice = gets.chomp.to_i
  #   end
  #
  #   #puts solar_system.choice(planet_choice)
  # end
end

# Create Planets using Planet Class
endor = Planet.new("Endor", 100000, 55000000, "Ewoks", "purple")
condor = Planet.new("Condor", 125000, 5000, "Condos", "emerald green")
alderan = Planet.new("Alderan", 92000, 9000000, "Alderians", "white")
dagobah = Planet.new("Dagobah", 919909, 1883005, "Dagonians", "red")
jonah = Planet.new("Jonah", 3000452, 1000, "None", "orange")
solaris = Planet.new("Solaris", 30000, 150, "Solarians", "vermillion")
# Create array of planets
planet_array = [endor, condor, alderan, dagobah, jonah, solaris]

# Create new SolarSystem with SolarSystem class and pass planet_array into it
solar_system = SolarSystem.new(planet_array)
#    solar_system.planet_add(solaris)

puts "Welcome to the Solar System!"

puts "The Solar System contains the following planets:"
puts solar_system.planet_names

puts "Would you like to view a planet in the Solar System? (Yes or No)"
view_planet = gets.chomp.downcase

#Allow user to explore a planet of choice from the list
until view_planet == "yes" || view_planet == "no"
  puts "Please answer yes or no."
  view_planet = gets.chomp.downcase
end

if view_planet == "yes"
  puts "Please type the number of the planet you would like to explore here."
  planet_choice = gets.chomp.to_i

  # Good Code #
  until planet_choice >= 1 && planet_choice <= planet_array.length
    puts "Invalid answer. Please select a planet number from the planets list."
    puts solar_system.planet_names
    planet_choice = gets.chomp.to_i
  end
  puts solar_system.choice(planet_choice - 1)

  #
  #   #New Code#
  # puts solar_system.choice(planet_choice)

end

#Allow user to add a planet
puts "Would you like to add a planet? (Yes or No)"
add_planet = gets.chomp.downcase
until add_planet == "yes" || add_planet == "no"
  puts "Invalid answer, please answer yes or no."
  add_planet = gets.chomp.downcase
end
if add_planet == "yes"
  puts "Wonderful! Let's create a new planet!"
  add_planet_hash = {name: nil, age: 0, distance: 0, inhabitants: nil, color: nil}
  puts "What would you like to name this new planet?"
  add_planet_hash[:name] = gets.chomp.capitalize
  puts "How old is the planet in space years?"
  add_planet_hash[:age] = gets.chomp.to_i
  puts "How far is the planet from the sun in space years?"
  add_planet_hash[:distance] = gets.chomp.to_i
  puts "If there are any inhabitants, please enter the name of the inhabitants (ex: Ferengi), otherwise enter 'none'."
  add_planet_hash[:inhabitants] = gets.chomp.capitalize
  puts "Finally, what color is the planet?"
  add_planet_hash[:color] = gets.chomp.downcase
  add_planet_hash[:name] = Planet.new(add_planet_hash[:name], add_planet_hash[:age], add_planet_hash[:distance], add_planet_hash[:inhabitants], add_planet_hash[:color])
  solar_system.planet_add(add_planet_hash[:name])
  puts "Congratulations on creating the newest planet in the Solar System. \n\n"
  puts "The Solar System now contains the following planets:"
  puts solar_system.planet_names
  puts "Thanks for checking out the Solar System! Come again soon!"
else puts "Okay, that's all for now. Check out the Solar System again soon!"
end
