########################################
# Wave 3
########################################

# Goals
  # 1. user can select a planet
  # 2. user can view info about planet
  # 3. user can add their own planet


# Wave three is partially complete because it took me some time to understand the fundamentalls.
# please provide some good feedback on my existing work.

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
    It takes #{@orbit_time} to orbit its sun."
    return planet_characteristics_ouput
  end

  def planets_name
    list_planet_names = "#{@name}\n"

    return list_planet_names
  end

  def planet_detail
    planet_details = "
    #{@name}'s volume = #{@volume}.
    Is it solid? #{@solid}.
    #{@name} diameter is #{@diameter}.
    It takes #{@orbit_time} to orbit its sun."
    return planet_details
  end

  def name_of_planet
    return @name
  end
end # end of planet class


class SolarSystem
  # attr_writer :name
  def initialize(planet_object_collection)
    # @name
    @solar_system = planet_object_collection
  end

  # syntax used to override the existing characteristic
  # def name=(name)
  #   @name = name
  # end

  def add_planet_object(new_planet_object)
    @solar_system.push(new_planet_object)
  end

  # Outputs all planet's details
  def return_solar_system_info
    solar_system_output = ""
    @solar_system.each do |planet_object| # planet_object represents a new planet instance
      #add to planet_output string
      solar_system_output += planet_object.planet_output
    end
    return solar_system_output
  end

  # makes list of planet names for user
  def return_planet_names
    planet_names = ""
    @solar_system.each do |planet_name|
      planet_names += planet_name.planets_name
    end
    return planet_names
  end

  def planet_details
    planet_details = ""
    @solar_system.each do |planet_char|
      planet_details = planet_char.planet_detail
    end
    return planet_details
  end
end # end of class

planets_wave_2 = [
  Planet.new("Angela", 15, 20, "no", 1),
  Planet.new("Tamira", 10, 2, "yes", 2),
]

solar_system = SolarSystem.new(planets_wave_2)
solar_system.return_solar_system_info

#
# puts "The solar system contains the following planets. #{solar_system.return_planet_names}"
#

name = Planet.new("earth", 1, 2, "yes", 1)

puts "Your solar system has the following planets:

#{solar_system.return_planet_names}
Please chose a planet to learn its characteristics."




user_selection = gets.chomp
if user_selection == solar_system.name_of_planet
  return solar_system.planet_details
end

puts "testing"
puts user_selection_planet
puts "testing"

########################################
# Wave 2
########################################

# Primary Requirements

# Create a Planet class which will represent a planet.
# Add an initialize method which takes several arguments and uses them to set the class' instance variables.
# Create a method that returns the Planet's attributes in an easy to read fashion.
# Create reader methods to give a user access to read the instance variables.
# Make your SolarSystem class take an array of Planets instead of hashes.
# When printing the planet list or planet details, it should call the corresponding method in Planet.

# Optionals
#
# Create a method, outside any class, which creates a planet from user input.

# class Planet
#   # Line below is an attribute reader with all attributes in one method.
#   attr_reader :name, :volume, :solid, :diameter, :orbit_time
#
#
#   def initialize(name, volume, diameter, solid, orbit_time)
#     @name = name
#     @volume = volume
#     @solid = solid
#     @diameter = diameter
#     @orbit_time = orbit_time
#   end
#
#   # The following two methods are examples of attribute readers
#   # def name
#   #   @name
#   # end
#   #
#   # def volume
#   #   @volume
#   # end
#   # End examples of attribute readers
#
#   def planet_output
#     planet_characteristics_ouput = "
#     Your planet's name = #{@name}.
#     Your planet's volume = #{@volume}.
#     Is it solid? #{@solid}.
#     Its diameter is #{@diameter}.
#     It takes #{@orbit_time} to orbit its sun."
#     return planet_characteristics_ouput
#   end
# end # end of planet class
#
#
# class SolarSystem
#   # attr_writer :name
#   def initialize(planet_object_collection)
#     # @name
#     @solar_system = planet_object_collection
#   end
#
#   # syntax used to override the existing characteristic
#   # def name=(name)
#   #   @name = name
#   # end
#
#   def add_planet_object(new_planet_object)
#     @solar_system.push(new_planet_object)
#   end
#
#   def return_solar_system_info
#     solar_system_output = ""
#       @solar_system.each do |planet_object| # planet_object represents a new planet instance
#       #add to planet_output string
#        solar_system_output += planet_object.planet_output
#     end
#     return solar_system_output
#   end
# end # end of class
#
# planets_wave_2 = [
#   Planet.new("Angela", 15, 20, "no", 1),
#   Planet.new("Tamira", 10, 2, "yes", 2),
# ]
# puts "testing"
# puts SolarSystem.new(planets_wave_2).return_solar_system_info
# puts "testing"



# puts "New instance: #{solar_system = SolarSystem.new(planets)}"
# puts "Adding a new planet made of a hash: #{solar_system.add_planet({name: "saturn", volume: 4, diameter: 100, solid: "no", orbit_time: 15})}"
# puts solar_system.return_info

# jamie_planet = Planet.new("Jamie", 10, 25, "yes", 2)
# ss2_planets = [planet_wave_2, jamie_planet]
# ss2 = SolarSystem.new([Planet.new("Angela", 10, 25, "no", 2), Planet.new("Jamie", 10, 25, "yes", 2)])
# ss2.return_info


##########################
# Example of something
##########################

# def style=(new_style)
#   @style = new_style
# end



#####################################################
#   Wave 1
#####################################################


# Create an initialize method which should take a collection of planet names and store them in an @planets instance variable.
# Create a method to add a planet to the list.
# Create a method which will return not print a list of the planets as a String in this style:
# 1.  Mercury
# 2.  Venus
# 3.  Earth
# 4.  Mars
# 5.  Jupiter
# 6.  Hoth
# Write code to test your SolarSystem
# Instead of Strings for planets, modify SolarSystem's initialize method to take a list of hashes where each planet is sent as a hash with at least 5 attributes.


# Optional Enhancements
#
# Give each planet a year_length attribute which is the length of time the planet takes to go around it's star.
# Give each planet a distance_from_the_sun attribute
# Write a program that asks for user input to query the planets:
# First, ask the user to select a planet they'd like to learn about.
# Present the user with a list of planets from which they can choose. Something like:
# 1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit
# Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
# Then ask the user for another planet.

# Goals
# 1. Create a solar system class with instance variable @planets
# 2. Make an initialize method to take a collection of planets and then store them in @planets
# 3. add planets to the list with a method
# 4. create a method to return the list as a string.
# 5. write code to test your solar SolarSystem
# 6. instead of string make a list of hashes


# ======= Code used with hashes of planet characteristics ===============

# class SolarSystem
#   # attr_writer :name
#   def initialize(planets_collection)
#     # @name
#     @planets = planets_collection
#   end
#
#   # syntax used to override the existing characteristic
#   # def name=(name)
#   #   @name = name
#   # end
#
#   def add_planet(new_planet)
#     @planets.push(new_planet)
#   end
#
#   def return_info
#     planet_output = ""
#     (1..@planets.length).each do |x|
#       planet_hash = @planets[x-1]
#        planet_output += "#{x}. Your planet is #{planet_hash[:name]}. It has the following characteristics:
#         1. Volume = #{planet_hash[:volume]}
#         2. Diameter = #{planet_hash[:diameter]}
#         3. Solid = #{planet_hash[:solid]}
#         4. Orbit time around its Sun = #{planet_hash[:orbit_time]}\n"
#     end
#     return planet_output
#   end
#
#   # def style=(new_style)
#   #   @style = new_style
#   # end
# end # end of class
#
# planets = [
#   {
#     name: "Earth",
#     volume: 2,
#     diameter: 50,
#     solid: "Yes",
#     orbit_time: 5,
#   },
#
#   {
#     name: "Mars",
#     volume: 4,
#     diameter: 100,
#     solid: "Yes",
#     orbit_time: 10,
#   },
# ]
#
# puts solar_system = SolarSystem.new(planets)
# puts solar_system.add_planet({name: "saturn", volume: 4, diameter: 100, solid: "no", orbit_time: 15})
# puts solar_system.return_info


# ======= Code used with an array of planets ======================

# class SolarSystem
#   # attr_writer :name
#   def initialize(planets_collection)
#     # @name
#     @planets = planets_collection
#   end
#
#   # syntax used to override the existing characteristic
#   # def name=(name)
#   #   @name = name
#   # end
#
#   def add_planet(planet_name)
#     @planets.push(planet_name)
#   end
#
#   def return_info
#     planet_output = ""
#     (1..@planets.length).each do |x|
#        planet_output += "#{x}. #{@planets[x-1]}\n"
#     end
#     return planet_output
#   end
#
#   # def style=(new_style)
#   #   @style = new_style
#   # end
# end # end of class
#
# planets_array = [
#   "Earth",
#   "Mars"
# ]
#
# puts solar_system = SolarSystem.new(planets)
# puts solar_system.add_planet("venus")
# puts "This is the return as a string: #{solar_system.return_info}"
# solar_system.name = "SS"
