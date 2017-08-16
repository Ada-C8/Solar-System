
class SolarSystem
  attr_reader :ss_user_choice

  def initialize(ss)
    @ss = ss
  end


  def ss_user_choice
    puts "Here are your planets:"
    @ss.each do |ss_planet|
      puts ss_planet.name
    end
    puts "What planet do you want to learn more about? Please properly capitalize:"
    # currently only accepts capitalized planets
    planet_choice = gets.chomp
    @ss.each do |ss_planet|
      if planet_choice == ss_planet.name
        puts ss_planet.print_planet
      # else statement is always printing. not sure why
      # else
      #   puts "Sorry, you inputted an invalid planet"
      #   exit
      end
    end
  end
end

class Planet
  attr_accessor :name, :moons, :year_length, :distance_from_the_sun, :named_after, :print_planet

  def initialize(name, moons, year_length, distance_from_the_sun, named_after)
    @name = name
    @moons = moons
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @named_after = named_after
  end

  #FINAL PRINTS INDIVIDUAL PLANET DESCRIPTIONS
    def print_planet
      print_print_planet =
  "WAVE2 This is the planet #{@name}
  WAVE2 It has #{@moons} moon(s)
  WAVE2 A year length is #{@year_length}
  WAVE2 It is #{@distance_from_the_sun} from the sun
  WAVE2 It is named after the #{@named_after}.\n\n"

  return print_print_planet
    end

end
#end Planet class

def add_new_planet(ss)
  puts "Hello! Let's add a planet! What's is its name?"
  user_planet_name = gets.chomp
  puts "How many moons does it have?"
  user_planet_moons = gets.chomp
  puts "How long does a year take?"
  user_planet_year_length = gets.chomp
  puts "What's its distance from the sun?"
  user_planet_distance_from_the_sun = gets.chomp
  puts "Who is it named after?"
  user_planet_named_after = gets.chomp

  user_planet = Planet.new(user_planet_name, user_planet_moons, user_planet_year_length, user_planet_distance_from_the_sun, user_planet_named_after)
  ss << user_planet
  return ss
end



mercury = Planet.new("Mercury", 0, "88 days", "0.39 AU", "Roman god of travel")
venus = Planet.new("Venus", 0, "225 days", "0.72 AU", "Roman goddess of love and beauty")
earth = Planet.new("Earth", 0, "365 days", "1 AU", "the ground")
mars = Planet.new("Mars", 2, "1.88 years", "1.52 AU", "Roman god of war")
jupiter = Planet.new("Jupiter", 67, "11.86 years", "5.2 AU", "king of the Roman gods")
saturn = Planet.new("Saturn", 60, "29.46 years", "9.58 AU", "Roman god of agriculture")
uranus = Planet.new("Uranus", 27, "84.01 years", "19.2 AU", "ancient Greek king of the gods")
neptune = Planet.new("Neptune", 14, "164.75 years", "30.05 AU", "Roman god of the sea")
ss = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
ss = add_new_planet(ss)

new_solar_system = SolarSystem.new(ss)


new_solar_system.ss_user_choice
