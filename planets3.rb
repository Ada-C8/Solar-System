class Planet
  attr_accessor :planet_hash

  def initialize(name, year_length, distance_from_the_sun, number_moons, planet_color)
    @planet_hash = {
      "The name of the planet is" =>  name,
      "The length of a year is" =>  year_length,
      "The distance from the sun is" => distance_from_the_sun,
      "The number of moons are" => number_moons,
      "The planets color is" => planet_color
    }
  end
end
# begin trial for user input
# def add_new_planet
# #
#   answer = ""
#
#   until answer == "no"
#     print "\nEnter a planet name to add to the collection: "
#     new_planet_name = gets.chomp.to_s
#     @planets_array.push(new_planet_name)
#
#     print "\nWould you like to add another planet? (type yes/no) "
#     answer = gets.chomp.to_s
#   end
# end
#


#end trial
class SolarSystem
  attr_accessor :planet_list
  def initialize
    @planet_list = []
  end

  def add_planet(planet)
    @planet_list.push(planet)
  end


  def print
    planet_list.each do |planet|
      puts planet.name
    end
  end
3


end

pluto = Planet.new("Pluto","one year!","8 million miles", "2", "blue")
kayland = Planet.new("Kayland","five years!","2 million miles","7","purple")
haven = Planet.new("Haven","six years!","1 million miles","3","silver")
ariel = Planet.new("Ariel","ten years!","5 miles","4","grey")
verse = Planet.new("Verse","six years!","3 million miles","1","orange")
lilac = Planet.new("Lilac","seven years!","8 thousand miles","2","green")

def print_attributes(planet)
  x = planet.planet_hash
  x.keys.sort.each do |key|
    puts "#{key} : #{x[key]}"
  end
end




puts "\n Welcome explorer!\n Here's a list of possible planets that are ready to be learned about! \n 1.Pluto\n 2.Kayland\n 3.Haven\n 4.Verse\n 5.Lilac\n 6.Ariel\n"
puts " So which planet shall be chosen first? "
planet_selected = gets.chomp

case planet_selected
when "pluto"
  print_attributes(pluto)
when "kayland"
  print_attributes(kayland)
when "haven"
  print_attributes(haven)
when "verse"
  print_attributes(verse)
when "lilac"
  print_attributes(lilac)
when "ariel"
  print_attributes(ariel)
else
  print "You discovered a new planet not yet in the database! For now, please select one of the following options: \n 1.Pluto\n 2.Kayland\n 3.Haven\n 4.Verse\n 5.Lilac\n 6.Ariel\n"
  return

end
