#Wave Three (Wave One Hash Version follows, but is commented out; Wave Two is encapsulated in Wave Three)

class Planet

  attr_reader :name, :namesake, :type, :year, :distance 

  def initialize(name, namesake, type, year, distance)
    @name = name
    @namesake = namesake
    @type = type
    @year = year
    @distance = distance
  end

  def give_info
    list =  "#{@name}: \tNamed for: #{@namesake} \tType: #{type} \tYear: #{year} Earth Years \tDistance: \t#{distance} million kilometers."
    return list
  end

end

class SolarSystem

  def initialize(list_of_planets)
    @planets = list_of_planets
  end

  def add_planet(planet)
    @planets += planet
  end

  def print_list
    list = ""
    @planets.each_with_index do |planet, index|
      list += @planets[index].give_info + "\n"
    end
    return list
  end

  def check_input(input)
    until input.is_a?(Integer) && input.between?(1, 9)
      print "Please enter a number between 1 and 9: "
      input = gets.chomp.to_i
    end
  end

  def select_planet
    puts "Which Planet do you want to learn about? Choose from the following options: 1. Mercury, 2. Venus, 3. Earth, 4. Mars, 5. Jupiter, 6. Saturn, 7. Uranus, 8. Neptune, 9. Pluto "
    answer = gets.chomp.to_i

    check_input(answer)

    choice = @planets[answer - 1]

    puts "You chose #{choice.name}. Here's what I know about #{choice.name}: \n\n"

    list = "#{choice.name} was named for #{choice.namesake}. Its year is #{choice.year} earth years long. It is #{choice.distance} million kilometers from the sun and it is #{choice.type}.\n\n"

    return list
  end

  def find_distance_between_planets
    puts "Now you can tell the distance between two planets: "

    puts "\nWhat is the first planet you want to compare. Choose from the following options: 1. Mercury, 2. Venus, 3. Earth, 4. Mars, 5. Jupiter, 6. Saturn, 7. Uranus, 8. Neptune, 9. Pluto "
    planet_1 = gets.chomp.to_i

    check_input(planet_1)

    puts "\nWhat is the second planet you want to compare. Choose from the following options: 1. Mercury, 2. Venus, 3. Earth, 4. Mars, 5. Jupiter, 6. Saturn, 7. Uranus, 8. Neptune, 9. Pluto "
    planet_2 = gets.chomp.to_i

    check_input(planet_2)

    distance_between_planets = @planets[planet_1 - 1].distance - @planets[planet_2 - 1].distance

    puts "\nThe distance between #{@planets[planet_1 - 1].name} and #{@planets[planet_2 - 1].name} is #{distance_between_planets.abs} million kilometers as the crow flies.\n\n"
  end

end

mercury = Planet.new("Mercury", "the Roman god of travel", "hotter than hot", "0.241", 58)
venus = Planet.new("Venus", "the Roman goddess of love", "funky", "0.6152", 108)
earth = Planet.new("Earth", "an Old English word for the ground", "troubled", "1", 150)
mars = Planet.new("Mars", "the Roman God of war", "made of chocolate", "1.8809", 228)
jupiter = Planet.new("Jupiter", "the King of the Roman gods", "gassy", "11.8612", 778)
saturn = Planet.new("Saturn", "the Roman God of agriculture", "a big fan of Beyonce", "29.456", 1427)
uranus = Planet.new("Uranus", "an ancient Greek king of the Gods", "mocked by school children", "84.07", 2871)
neptune = Planet.new("Neptune", "the Roman God of the sea", "a lover of Trident gum", "164.81", 4497)
pluto = Planet.new("Pluto", "the Roman god of the underworld", "fiesty and defiant", "247.7", 5913)
milky_way = SolarSystem.new([mercury])
milky_way.add_planet([venus])
milky_way.add_planet([earth])
milky_way.add_planet([mars])
milky_way.add_planet([jupiter])
milky_way.add_planet([saturn])
milky_way.add_planet([uranus])
milky_way.add_planet([neptune])
milky_way.add_planet([pluto])


puts milky_way.select_planet

puts milky_way.find_distance_between_planets

def user_planet
  puts "Now you can create your own planet!\t"

  puts "What would you like to name your planet? "
  name = gets.chomp.to_s

  puts "Who or what is your planet named for? "
  namesake = gets.chomp.to_s

  puts "How would you describe your planet"
  type = gets.chomp.to_s

  puts "How long is your planet's year in Earth years (enter a number)? "
  year = gets.chomp.to_i

  puts "How far is your planet from its sun (in kilometers)? "
  distance = gets.chomp.to_i

  planetin = Planet.new(name, namesake, type, year, distance)

  result = "Here's some information about your planet: \n#{planetin.give_info}"

  return result

end

puts user_planet

################################
#Wave One, Hash Version

# 
# class SolarSystem
#   def initialize(planet)
#     @planets = Array.new
#     @planets << planet
#   end
# 
#   def add_planet(aplanet)
#     @planets << aplanet
#   end
# 
#   def print_list
#     list = ""
#     @planets.each do |planet|
#       planet.each do |category, description|
#         list += "#{category}: #{description} \t"
#       end
#       list += "\n"
#     end
#     return list
#   end
# 
#   def check_input(input)
#     until input.is_a?(Integer) && input.between?(1, 9)
#       print "Please enter a number between 1 and 9: "
#       input = gets.chomp.to_i
#     end
#   end
# 
#   def select_planet
#     
#     puts "Which Planet do you want to learn about? Choose from the following options: 1. Mercury, 2. Venus, 3. Earth, 4. Mars, 5. Jupiter, 6. Saturn, 7. Uranus, 8. Neptune, 9. Pluto "
#     answer = gets.chomp.to_i
# 
#     check_input(answer)
# 
#     choice = @planets[answer - 1]
# 
#     puts "You chose #{choice[:name]}\n"
#     puts "Here is what I know about #{choice[:name]}\n"
#     info = "#{choice[:name]} was named for #{choice[:namesake]}. Its year is #{choice[:year]} earth years long. It is #{choice[:distance]} million kilometers from the sun and it is #{choice[:type]}.\n\n"
#     return info
#   end
# 
# end #end of class definition
# 
# 
# milky_way = SolarSystem.new({name: "Mercury", namesake: "the Roman god of travel", type: "hotter than hot", year: "0.241", distance: 58})
# milky_way.add_planet({name: "Venus", namesake: "the Roman goddess of love", type: "funky", year: "0.6152", distance: 108})
# milky_way.add_planet({name: "Earth", namesake: "an Old English word for the ground", type: "troubled", year: "1", distance: 150})
# milky_way.add_planet({name: "Mars", namesake: "the Roman God of war", type: "made of chocolate", year: "1.8809", distance: 228})
# milky_way.add_planet({name: "Jupiter", namesake: "the King of the Roman gods", type: "gassy", year: "11.8612", distance: 778})
# milky_way.add_planet({name: "Saturn", namesake: "the Roman God of agriculture", type: "a big fan of Beyonce", year: "29.456", distance: 1427})
# milky_way.add_planet({name: "Uranus", namesake: "an ancient Greek king of the Gods", type: "mocked by school children", year: "84.07", distance: 2871})
# milky_way.add_planet({name: "Neptune", namesake: "the Roman God of the sea", type: "a lover of Trident gum", year: "164.81", distance: 4497})
# milky_way.add_planet({name: "Pluto", namesake: "the Roman god of the underworld", type: "fiesty and defiant", year: "247.7", distance: 5913})
# 
# puts milky_way.print_list
# 
# puts milky_way.select_planet
