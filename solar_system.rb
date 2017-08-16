class SolarSystem

  attr_accessor :name

  def initialize(name, planets) #Arguments: name of solar system, planets array
    @planets = planets
    @name = name
  end

  def add_planet(planet) #@planets is the existing array of planets
    @planets << planet
  end

  def planets
    count = 0
    planets_list = ""
    @planets.each do |planet|
      count += 1
      planets_list += "#{count}. #{planet.name}\n"
    end
    return planets_list
  end
  # Note: W1 Requirement - Create a method which will return not print a list of the planets as a String in this style:
  # The planets method will return a string (ex. "1. Planet1") for each planet in the planets array to compile a list of planets
  # Count & loop flow:
  # "" = "" + 1. Mercury
  # "1. Mercury\n" = "1. Mercury\n" + "2. Venus\n"
  # "1. Mercury\n2. Venus\n" = "1. Mercury\n2. Venus\n" + "3. Earth\n"
  # "1. Mercury\n2. Venus\n3. Earth\n" = "1. Mercury\n2. Venus\n3. Earth\n" + "4. Mars\n"

  def get_planet_details(planet_name) #Use method to return attributes of a specific planet based on planet_name
    @planets.each do |planet|
      if planet.name == planet_name
        return planet.get_attributes
      end
    end
  end

  def print_all_planet_details #Optional: Use when you need to read all planet details in system
    @planets.each do |planet|
      puts "#{planet.get_attributes}\n"
    end
  end

end #of SolarSystem Class~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


class Planet

  attr_reader :name, :year_length, :sun_distance, :moons, :notable_traits

  def initialize(name, year_length, sun_distance, moons, notable_traits)
    @name = name
    @year_length = year_length
    @sun_distance = sun_distance
    @moons = moons
    @notable_traits = notable_traits
    @planets = []
  end

  def get_attributes
    attributes = "\n\nPlanet Name: #{@name} \nLength of Year (Orbit): #{@year_length} Earth days\nDistance from the Sun: #{@sun_distance} AU (Astronomical Units)\nNumber of moons: #{@moons}\nNotable Trait(s): #{@notable_traits}"
    return attributes
  end

end #of Planet Class~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#USER INTERFACE METHODS
def learn_solar_system
  #SOLAR SYSTEM DEFAULT VALUES where planet = Planet.new(:name, :year_length, :sun_distance, :moons, :notable_traits)
  plan1_mercury = Planet.new("Mercury", 87.96, 0.39, 0, "Mercury is known to be rocky and looks like the Earth's moon.")

  plan2_venus = Planet.new("Venus", 224.68, 0.72, 0, "Venus uniquely rotates backwards & has a thick and toxic atmosphere.")

  plan3_earth = Planet.new("Earth", 365.26, 1, 1, "Earth is the only planet currently known to harbor life.")

  plan4_mars = Planet.new("Mars", 687, 142, 1.52, "Mars, also known as the Red Planet, is rich in iron minerals.")

  plan5_jupiter = Planet.new("Jupiter", 4343.5, 5.2, 67, "Jupiter has a Great Red Spot, which is a gigantic storm (bigger than Earth) that has been raging for hundreds of years.")

  plan6_saturn = Planet.new("Saturn", 10767.5, 9.5, 53, "Saturn is most famous and easily recognized for its spectacular ring system, which is made of seven rings with several gaps and divisions between them.")

  plan7_uranus = Planet.new("Uranus", 30660, 19.19, 27, "Though classified as a 'Gas Giant', Uranus is often referred to as an 'Ice Giant' as it is considered the coldest planet in our Solar System!")

  plan8_neptune = Planet.new("Neptune", 60225, 30.07, 13, "Neptune is the furthest planet from the sun. It can't be seen by a naked eye, but it was the first planet to be predicted to exist using math.")

  planets = [plan1_mercury, plan2_venus, plan3_earth, plan4_mars, plan5_jupiter, plan6_saturn, plan7_uranus, plan8_neptune]

  system = SolarSystem.new("Milkyway", planets)

  puts "\nWelcome to the Milkyway! Our Milkyway Solar System currently has the following planets:"
  puts system.planets

  puts "\nEnter a planet's name to learn more about each planet, or enter 'ALL' to get information for all planets!"
  planet_response = gets.chomp

  if planet_response == "Mercury"
    puts system.get_planet_details("Mercury")
  elsif planet_response == "Venus"
    puts system.get_planet_details("Venus")
  elsif planet_response == "Earth"
    puts system.get_planet_details("Earth")
  elsif planet_response == "Mars"
    puts system.get_planet_details("Mars")
  elsif planet_response == "Jupiter"
    puts system.get_planet_details("Jupiter")
  elsif planet_response == "Saturn"
    puts system.get_planet_details("Saturn")
  elsif planet_response == "Uranus"
    puts system.get_planet_details("Uranus")
  elsif planet_response == "Neptune"
    puts system.get_planet_details("Neptune")
  elsif planet_response == "ALL"
    system.print_all_planet_details
  else
    puts "Please enter a planet name from the list above."
    planet_response = gets.chomp
  end
end

def create_solar_system
  puts "\nAwesome, you decided to create and explore your own solar system!"
  puts "First, let's get started by naming your solar system."
  puts "\nEnter your solar system name here:"
  user_solar_system_name = gets.chomp
  user_planets = []

  user_system = SolarSystem.new(user_solar_system_name, user_planets)

  puts "\nNext, you'll answer a series of questions to create a planet to add to your #{user_solar_system_name} solar system."

  puts "\nWhat is the name of your planet? "
	user_planet_name = gets.chomp

	puts "What is the length of year for your planet in Earth days? "
	user_planet_year_length = gets.chomp

	puts "How far is your planet from the sun? (AU)"
	user_planet_sun_distance = gets.chomp

	puts "How many moons does the planet have? (number)"
	user_planet_moons = gets.chomp

	puts "Enter notable trait(s) regarding your planet?"
	user_planet_traits = gets.chomp

	user_planet = Planet.new(user_planet_name, user_planet_year_length, user_planet_sun_distance, user_planet_moons, user_planet_traits)

  puts "\nAlright, we'll add this new planet to your solar system!"

  user_planets << user_planet

  puts user_planet.get_attributes

  user_system = SolarSystem.new(user_solar_system_name, user_planets)

  puts user_system.planets

end


#TEST
# plan9 = Planet.new("Pluto", 60225, 1.8, 13, "Considered a dwarf planet!")
# system.add_planet(plan9)
# puts system.planets
# puts system.get_planet_details("Pluto")
# puts system.get_planet_details("Jupiter")
# puts system.name
# system.get_all_planet_details






#USER INTERFACE______________________________

user_introduction = <<YES
~~~~~~~~ * ~~~~~~~~~~~~~ * ~~~~~~~~~~~~~~~ * ~~~~~~~~~~~~~~ * ~~~~~~~~~
WELCOME TO THE SOLAR SYSTEMS EXPLORER
~~~ * ~~~~~~~~~~~ * ~~~~~~~~~~~~~ * ~~~~~~~~~~~~~~ * ~~~~~~~~~~~~~ * ~~

To use the Solar Systems Explorer, enter:
\n (A) If you would like learn more about our current solar system, or
\n (B) If you would like to create your own solar system to explore.
YES


twinkly_art = <<YES
      ~+
                    .
                *       +
          '                   |
      ()    .-.,="``"=.     - o -
            '=/_        .     |
         *   |  '=._    |
              .     `=./`,        '
           .   '=.__.=' `='      *
      +                         +
       O      *        '       .
                           *
YES

puts user_introduction
puts twinkly_art

begin_option = gets.chomp.upcase

#RUNNING OPTION A OR B

#REPROMPT USER TO ENTER BEGIN OPTION IF begin_option IS NOT A OR B
while true
  if begin_option == "A" || begin_option == "(A)"
    # REPLAY LOOP
    while true
      learn_solar_system
      puts "\nWould you like to learn about another planet in this solar system?"
      puts "Press any key to continue exploring this solar system, or enter \"NO\" to exit the program."
      more_solar_system_learning = gets.chomp

      if more_solar_system_learning.upcase == "NO"
        Process.exit(0)
      end
    end

  elsif begin_option == "B" || begin_option == "(B)"
    create_solar_system

    puts "\nWould you like to continue creating your solar system?"
    puts "Press any key to continue creating this solar system, or enter \"NO\" to exit the program."
    more_solar_system_creating = gets.chomp

    if more_solar_system_creating.upcase == "NO"
      Process.exit(0)
    end


  else
    puts "Please enter A or B."
    begin_option = gets.chomp.upcase
  end
end
