########################################
# Wave 3
########################################

# Goals
  # 1. user can select a planet
  # 2. user can view info about planet
  # 3. user can add their own planet


###################################
# Dan, There are comments and questions throughout my code that relate to design and scope. Please let me know your thoughts. 
# On an unrelated note, I recognize my use of comments for letting other devs know my train-of-thought are sparce and I am working to improve.
# Thank you for reviewing my solar system code again. I really appreciate your guidance and expertise. 
###################################

class Planet
  # Line below is an attribute reader with all attributes in one method.
  attr_reader :name, :volume, :solid, :diameter, :orbit_time


  def initialize(name, volume, diameter, solid, orbit_time)
    @name = name
    @volume = volume
    @solid = solid
    @diameter = diameter
    @orbit_time = orbit_time
  end

  def planet_output
    planet_characteristics_ouput = "
    Your planet's name = #{@name}.
    Your planet's volume = #{@volume}.
    Is it solid? #{@solid}.
    Its diameter is #{@diameter}.
    It takes #{@orbit_time} to orbit its sun.
    "
    return planet_characteristics_ouput
  end
end # end of planet class


class SolarSystem

  attr_reader :planets_collection

  # attr_writer :name
  def initialize(planet_object_collection)
    # @name
    @planets_collection = planet_object_collection
  end

  # syntax used to override the existing characteristic
  # def name=(name)
  #   @name = name
  # end

  def add_planet_object(new_planet_object)
    @planets_collection.push(new_planet_object)
  end

  # Outputs all planet's details
  def return_solar_system_info
    solar_system_output = ""
    @planets_collection.each do |planet_object| # planet_object represents a new planet instance
      #add to planet_output string
      solar_system_output += planet_object.planet_output
    end
    return solar_system_output
  end

  # return a list of planets with just their names
  def list_planet_names
    list_planet_names = []
    planets_collection.each do |planet_name|
      list_planet_names << planet_name.name
    end
    return list_planet_names
  end
  # given a name of the planet return the planet object

  def return_planet_object(planet_name)
    planets_collection.each do |planet|
      if planet.name == planet_name
        return planet.planet_output
      #once we get a match
      end
    end
  end
end # end of class

# Method for user to enter their own planet
def users_planet

  puts "Please enter the name of your planet."
  user_planet_name = gets.chomp

  puts "Please enter its volume."
  user_planet_volume = gets.chomp

  puts "Is your planet solid?"
  user_planet_solid = gets.chomp

  puts "Please enter its diameter."
  user_planet_diameter = gets.chomp

  puts "Please enter the time it takes to orbit its sun."
  user_planet_orbit_time = gets.chomp

end
planets_wave_2 = [
  Planet.new("Angela", 15, 20, "no", 1),
  Planet.new("Tamira", 10, 2, "yes", 2),
  Planet.new("earth", 1, 2, "yes", 1)
]

solar_system_1 = SolarSystem.new(planets_wave_2)

#
# puts "The solar system contains the following planets. #{solar_system.return_planet_names}"


earth = Planet.new("earth", 1, 2, "yes", 1)

puts "Your solar system has the following planets:\n\n"

# code to print list of planets in solar system to user
solar_system_1.planets_collection.each do |planet_names|
  puts planet_names.name
end
#{solar_system.return_planet_names}
puts "\nPlease choose a planet to learn its characteristics."

user_planet_selection = gets.chomp
if solar_system_1.list_planet_names.include?(user_planet_selection)
  puts "You have a match! #{solar_system_1.return_planet_object(user_planet_selection)}."
else
  puts "Sorry the planet you selected is not in this solar system. "
end

# Does user want to add their own planet?
puts "Would you like to add your own planet to this solar system?

Enter 'Y' for yes or 'N' for no."

# I thought about validating the user's entery and feel like that is not the point of the exercise.

user_add_planet = gets.chomp.upcase

if user_add_planet == "N"
  puts "Thank you for learning about a solar system!"
else
  puts "Great, now it's time to get your planets details."

    # I put the below code about the the user's planet in a method because I thought about giving the user multiple opportunities to make a planet. Then when I went it input the user variables into the new Planent instance, I could not access them (scope issue). Any pointers?
    puts "Please enter the name of your planet."
    user_planet_name = gets.chomp

    puts "Please enter its volume."
    user_planet_volume = gets.chomp

    puts "Is your planet solid?"
    user_planet_solid = gets.chomp

    puts "Please enter its diameter."
    user_planet_diameter = gets.chomp

    puts "Please enter the time it takes to orbit its sun."
    user_planet_orbit_time = gets.chomp
end

# Instantiate user's Planet instance.
users_planet = Planet.new(user_planet_name, user_planet_volume, user_planet_solid, user_planet_diameter, user_planet_orbit_time)

solar_system_1.add_planet_object(users_planet)

puts "Fantastic. Here is the updated solar system. #{solar_system_1.return_solar_system_info}

Thank you for learning!!"

# After writing the bit of code about the user adding a planet, I thought about looping through that section of code (lines 191 - 227) and I became stumped. Where do I draw a boundary for scope, do I use a method to contain the user inputs, what is the syntax for looping through the code? Will you provide some guidance?





