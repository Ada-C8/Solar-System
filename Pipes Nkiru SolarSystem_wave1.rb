#wave 1
class SolarSystem
  attr_accessor :planets #:planet_array

# initialize
  def initialize(planets)
    @planets = planets
  end

#  add planet to array
  def planet_add(planet)
    @planets.push(planet)
    return @planets
  end

# return list of planets
  def planet_list
    return @planets
  end

# output
  def print_list
    num = 1
    @planets.each do |planet_array|
      planet_array.each do |planet, attribute|
      puts "#{num}. #{planet}: #{attribute}"
      num += 1
      end
      return @planets
    end
  end


# User input to query planets
  def select_planet
    puts "Hello! What planet do you want to learn about?"
    puts "Select 1:Mercury, 2:Venus, 3:Earth, 4:Mars, 5:Jupiter, 6: Saturn, 7:Uranus, 8:Neptune, 9:Pluto, 10:Exit"
    while user_input = gets.chomp.downcase
      if user_input == "1"
        puts "Mercury, Mass: 0.330 e24 kg, Diameter: 4879 km, Distance_from_Sun: 57.9 e6 km, Num_Moons: 0, Gravity: 3.7, Year_Length: 88.0 days"
      elsif user_input == "2"
        puts "Venus: Mass: 4.87 10e24kg, Diameter: 12,104 km, Distance_from_Sun: 108.2 e6km, Num_Moons:0, Gravity: 8.9, Year_Length: 224.7"
      elsif user_input == "3"
        puts "Earth: Mass: 5.97 e24kg, Diameter: 12,756 km, Distance_from_Sun: 149.6 e6km, Num_Moons:1, Gravity: 9.8, Year_Length: 365.2 days"
      elsif user_input == "4"
        puts "Mars:  Mass: 0.642 e24kg, Diameter: 6792 km, Distance_from_Sun: 227.9 e6km, Num_Moons:2, Gravity: 1.6, Year_length: 687.0 days"
      elsif user_input == "5"
        puts "Jupiter: Mass: 1898 e24kg, Diameter: 142,984 km, distance_from_Sun: 778.6 e6km, Num_Moons:67, Gravity: 23.1, Year_length: 4331 days"
      elsif user_input == "6"
        puts "Saturn: Mass: 568 e24kg, Diameter: 120536 km, Distance_from_Sun: 1433.5 e6km, Num_Moons:62, Gravity: 9.0, Year_length: 10747 days."
      elsif user_input == "7"
        puts "Uranus: Mass: 86.8 e24kg, Diameter: 511 km, Distance_from_Sun: 2872.5 e6km, Num_Moons:27, Gravity: 8.7, Year_Length: 30589 days"
      elsif user_input == "8"
        puts "Neptune:  Mass: 102 e24kg, Diameter: 49528 km, Distance_from_Sun: 4495.1 e6km, Num_Moons:14, Gravity: 11.0, Year_Length: 59800 days"
      elsif user_input == "9"
        puts "Pluto: Mass: 0.014 6e24kg, Diameter: 2370 km, Distance_from_Sun: 5906.4 e6km, Num_Moons:5, Gravity: 0.7, Year_Length: 90560 days"
      elsif
        user_input == "10"
        puts "Hope you enjoyed learning about planets, GOOD-BYE"
      break
      end
    end
  end
end #end of solarsystem class

# testing
# planets = ["mercury", "venus", "earth", "mars", "jupiter", "hoth"]
# SolarSystem.new(mercury)
# puts SolarSystem.new.planet_add(mercury)
# puts SolarSystem.new.planet_list
#Wave 1
# solar_system = SolarSystem.new("planet")
# # puts solar_system
# solar_system.planet_add("Venus")
# solar_system.planet_add("Mars")
# solar_system.planet_add("Earth")
# # list = solar_system.planet_list
# # puts list
# solar_system.print_list

# Refactor
solar_system = SolarSystem.new([{name:"Mars", diameter: 4222, mass: 6.42, year_length:686.98, num_moons: 2}])
solar_system.planet_add({name:"Jupiter", diameter: 88729, mass: 1.90, year_length:11.862, num_moons: 67})
solar_system.planet_add([{name:"Mercury", diameter: 4222, mass: 6.42, year_length:686.98, num_moons: 2}])


# solar_system.planet_add
# solar_system.planet_list
# solar_system.select_planet
solar_system.print_list
