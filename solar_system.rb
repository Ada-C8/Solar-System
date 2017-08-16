# define the SolarSystem class
class SolarSystem
  # can read name instance variable
  attr_reader :name
  # can read and write planets, constellation, and type instance variables
  attr_accessor :planets, :constellation, :type, :age
  # initialize instance variables with default values, name required
  def initialize(name)
    @planets = []
    @name = name
    @constellation = nil
    @type = nil
    @age = 0
  end
  # lists all SolarSystem objects
  def self.all
    solar_systems = []
    ObjectSpace.each_object(self) do |system|
      solar_systems.push(system)
    end
    return solar_systems
  end

  def self.list
    ObjectSpace.each_object(self) { |star| puts star.name }
  end
  # prints solar system info
  def info
    <<~INFO
       ~~ Solar System Stats ~~
       Name: #{@name}
       Type: #{@type}
       Constellation: #{@constellation}
       Planets: #{self.list_planets(:comma)}
    INFO
  end
  # adds a planet to the @planets array and assigns solar system to planet object
  def add_planet(planet_name)
    @planets.push(planet_name)
    planet_name.solar_system = self.name
  end
  # provides a list of planets, formatted for a single line or an ordered list
  def list_planets(format)
    planet_list = ""

    if format == :num
      @planets.each do |planet|
        num = @planets.index(planet)
        planet_list.concat("#{num + 1}. #{planet.name}\n")
      end
    elsif format == :comma
      @planets.each do |planet|
        planet_list.concat(planet.name + ", ")
      end
      return planet_list.strip.chop
    end
    return planet_list
  end
  # runs interactive menu

end # end of SolarSystem class definition

class Planet
  attr_reader :name, :positon, :mass, :radius, :orbital_period

  attr_accessor :solar_system
  # initialize with required information for planet formation
  def initialize(name, position, mass, radius, orbital_period, solar_system)
    @name = name
    @position = position
    @mass = mass
    @radius = radius
    @orbital_period = orbital_period
    @solar_system = solar_system

    self.add_to_ss(@solar_system)
  end
  # lists all Planet objects
  def self.list
    ObjectSpace.each_object(self) { |planet| puts planet.name }
  end
  # returns an array of planet objects
  def self.all
    planets = []
    ObjectSpace.each_object(self) do |planet|
      planets.push(planet)
    end
    return planets
  end
  # display planet information (nil values will show blank)
  def info
    <<~INFO
    ~~ Planet Particulars ~~
    Name: #{@name}
    Position: #{@position}
    Mass: #{@mass}
    Radius: #{@radius}
    Orbital Period (in days): #{@orbital_period}
    Solar System: #{@solar_system}
    INFO
  end

  def add_to_ss(solarSystem)
    solarSystem.add_planet(self)
  end
end # end of Planet class definition

 def user_menu
   # returns an array with SolarSystem objects, creates numbered list of object names
   def star_list
     solar_systems = SolarSystem.all
     solar_systems.each do |star_system|
       num = solar_systems.index(star_system)
       puts "#{num + 1}. #{star_system.name}"
     end
     return solar_systems
   end
   # enter Solar System menu
   # recursive loop allows user to continue accessing the menu or exit
   def solar_query(solar_system)
     puts "Welcome to the #{solar_system.name} Solar System!"
     puts solar_system.info

     puts "Enter \"P\" to explore the planets. Or, enter \"N\" to create your own planet!"
     puts "You can also enter \"X\" to return to the previous menu."
     menu_opt = gets.chomp.upcase
     until menu_opt == "P" || menu_opt == "N" || menu_opt == "X"
       puts "Invalid entry. Enter \"P\" to explore the planets, or \"N\" to create your own planet."
       menu_opt = gets.chomp.upcase
     end

     case menu_opt
     when "P"
       planet_query(solar_system)
     when "N"
       user_planet(solar_system)
       solar_query(solar_system)
     when "X"
       user_menu
     end
   end # end solar_query

   # shows planet list
   def planet_query(solar_system)
     puts solar_system.list_planets(:num)

     puts "Enter the number of a planet to learn more about it: "
     planet_index = gets.chomp.to_i - 1
     # catches invalid index numbers and strings
     planets = solar_system.instance_variable_get(:@planets)
     while planets[planet_index] == nil || planet_index < 0
       puts "That is an invalid number. Please enter a number from the list"
       solar_system.list_planets(:num)
       planet_index = gets.chomp.to_i - 1
     end
     puts planets[planet_index].info

     puts "Enter \"M\" to see the planet list again. Enter \"X\" to return to the previous menu."
     again = gets.chomp.upcase
     until again == "M" || again == "X"
       puts "Invalid entry. Enter \"M\" to return the planet list. Enter \"X\" to exit."
       again = gets.chomp.upcase
     end
     if again == "M"
       planet_query(solar_system)
     elsif again == "X"
       solar_query(solar_system)
     end
   end # end of planet_query method definition
   # allows user to enter new planet information (no checks)
   def user_planet(solar_system)
     puts "Your new planet will need a name: "
     name = gets.chomp
     puts "Tell me more about planet #{name}! Just hit return (enter) on your keyboard if don't know the value."
     puts "Position from its star (star is position 0): "
     position = gets.chomp
     puts "Mass: "
     mass = gets.chomp
     puts "Radius: "
     radius = gets.chomp
     puts "Orbital Period (days to get around the star once): "
     orbital_period = gets.chomp
     star = solar_system

     user_planet = Planet.new(name, position, mass, radius, orbital_period, star)
   end # end of user_planet method definition

   puts "Welcome to the Interactive Galaxy!"
   puts "Please enter the number of a star system to get started: "
   star_list
   star_index = gets.chomp.to_i - 1

   while star_list[star_index] == nil || star_index < 0
     puts "That is an invalid entry. Please enter a number from the list"
     star_list
     star_index = gets.chomp.to_i - 1
   end
   # start cascading menu methods
   solar_query(star_list[star_index])
 end
 
