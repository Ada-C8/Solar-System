#Class uses array of planet instances as an argument.
class SolarSystem

  def initialize(all_planets_array)
     @all_planets_array = all_planets_array
   end
#method interacts with user to view planets
   def ask_user
     puts
     puts "Here is a list of planets:"
     puts
     @all_planets_array.each do |planets|
       puts planets.name
     end
     puts
     puts "What planet would you like to learn more about?"
     choice = gets.chomp
     @all_planets_array.each do |planets|
        if choice == planets.name
          puts planets.return_attributes
          puts "Would you like to view another planet? y for yes, n for no."
          more_planets = gets.chomp.downcase
          case more_planets
          when "y"
            ask_user
          when "n"
            exit
          else
            puts "Invalid response."
            exit
          end

        end

      end
       puts "Invalid choice."
       ask_user
   end
end

# Class creates instances of planets and holds method for returning planet data
class Planets
  attr_reader :name, :year_length, :distance_from_sun, :radius, :satellites, :return_attributes

  def initialize(name, year_length, distance_from_sun, radius, satellites)
    @name = name
    @year_length = year_length
    @distance_from_sun = distance_from_sun
    @radius = radius
    @satellites = satellites
  end
#method to show planet info
  def return_attributes
    print_out = "
            #{@name}'s year length is #{@year_length}.
            Its distance from the sun is #{@distance_from_sun}.
            Its radius is #{@radius} long.
            It has #{@satellites} satellites.

            "
            return print_out
  end

end
#Method outside of classes gets user input to generate new instance
# of planets and adds it to planet_holder array
def user_input(planet_holder)
  puts
  puts "Welcome to our Solar System."
  puts "Let's add a new planet!"
  puts
  puts "What is your planet's name?"
  name = gets.chomp
  puts
  puts "What's its year length?"
  year_length = gets.chomp.downcase
  puts
  puts "What's its distance from the sun?"
  distance_from_sun = gets.chomp.downcase
  puts
  puts "What's its radius?"
  radius = gets.chomp.downcase
  puts
  puts "How many satellites does it have?"
  satellites = gets.chomp.downcase
  puts
  user_planet = Planets.new(name, year_length, distance_from_sun, radius, satellites)
  planet_holder << user_planet
  return planet_holder
end
#class instances of planets contain all planet info.
mercury = Planets.new("Mercury", "88 days", "35.98 million miles", "1,516 miles", "zero")
venus = Planets.new("Venus", "225 days", "67.24 million miles", "3,760 miles", "zero" )
earth = Planets.new("Earth", "365 days", "92.96 million miles", "3,959 miles", "one")
mars = Planets.new("Mars", "687 days", "141.6 million miles", "3,396 miles", "two")
jupiter = Planets.new("Jupiter", "12 years", "483.8 million miles", "69,911 miles", "69")

planet_holder = [mercury, venus, earth, mars, jupiter]
#calls user_input method and saves it's return as new planet_holder array
planet_holder = user_input(planet_holder)
#makes new instance of SolarSystem with planet_array as argument
new_solar = SolarSystem.new(planet_holder)
new_solar.ask_user
