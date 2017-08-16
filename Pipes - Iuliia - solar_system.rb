class Planet
  attr_accessor :name, :mass, :distance, :diameter, :orbit

  def initialize(name, mass, distance, diameter, orbit)
    @name = name
    @mass = mass.to_f
    @distance = distance.to_f
    @diameter = diameter.to_f
    @orbit = orbit.to_f
  end

  def info
    return "Planet: #{@name}\nMass: #{@mass}\nDistance: #{@distance}\nDiameter: #{@diameter}\nOrbit: #{@orbit}"
  end

end #end of class Planet

class SolarSystem

  attr_accessor :planets, :age

  def initialize(initial_planets, age)
    @planets = initial_planets
    @age = age
  end

  def add_planet(planet)
    @planets << planet
  end

  def planet_list
    result = ""
    @planets.each do |planet|
      result +=  "#{planet.info}\n\n"
    end
    return result
  end

  def planet_name_str
    planet_arr = []
    i = 0
    @planets.each do |planet|
      i += 1
      planet_arr << "#{i}. #{planet.name}"
    end
    return planet_arr.join(", ")
  end

  def planet_name_by_index(input)
    if input <= 0 || input > @planets.length
      return nil
    else
      return @planets[input - 1]
    end
  end

  def distance_between_planets(your_planet)
    result_str = ""
    @planets.each do |planet|
      result = planet.distance - your_planet.distance
      if result != 0
        result_str +=  "Distance between #{your_planet.name} and #{planet.name} is #{result.abs.round(2)}\n"
      end
    end
    return result_str
  end

  def planet_age(planet)
    return @age * planet.orbit / 365.0
  end

end #end of class SolarSystem

def user_input_planet
  puts "\nPlease tell us about your planet:\nname of your planet: "
  name = gets.chomp
  puts "mass of your planet: "
  mass = gets.chomp.to_f
  puts "distance: "
  distance = gets.chomp.to_f
  puts "diameter: "
  diameter = gets.chomp.to_f
  puts "orbit: "
  orbit = gets.chomp.to_f
  name = Planet.new("#{name.capitalize}", mass, distance, diameter, orbit)
  return name
end

earth = Planet.new("Earth", 5972, 92.96, 7926, 365)
mars = Planet.new("Mars", 639, 141.6, 4217, 687)
jupiter = Planet.new("Jupiter", 1898, 483.8, 86881, 4343)

my_planets = [earth, mars, jupiter]

puts "\nWould you like to add a new planet to our list? (Y/N)"
input = gets.chomp.upcase
while input == "Y"
  user_planet = user_input_planet
  my_planets << user_planet
  puts "\nWould you like to add another planet to our list? (Y/N)"
  input = gets.chomp.upcase
end

my_system = SolarSystem.new(my_planets, 5 * 10 ** 9)

new_planet = Planet.new("Pluto", 1.3, 3.67, 1475, 90520)
my_system.add_planet(new_planet)

puts "\nPlease choose the number of a planet you'd like to learn about: #{my_system.planet_name_str}"
input = gets.chomp.to_i

user_choice = my_system.planet_name_by_index(input)

if user_choice == nil
  puts "You've entered the wrong number. Here is the information about all our planets:\n\n#{my_system.planet_list}"
else
  puts "Here is the information about planet #{user_choice.name}:\n\n#{user_choice.info}"
end

puts "\nPlease choose the number of a planet you would like to know what distances from other planets are: #{my_system.planet_name_str}"
input = gets.chomp.to_i

user_choice = my_system.planet_name_by_index(input)

if user_choice == nil
  puts "You've entered wrong number\n\n"
else
  puts my_system.distance_between_planets(user_choice)
end

puts "\nPlease choose the number of a planet to find out the local year of the planet: #{my_system.planet_name_str}"
input = gets.chomp.to_i

user_choice = my_system.planet_name_by_index(input)

if user_choice == nil
  puts "You've entered wrong number\n\n"
else
  puts "\nThe local year of the planet #{user_choice.name} is #{my_system.planet_age(user_choice).round(2)}"
end
