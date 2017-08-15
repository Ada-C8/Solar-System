# define a Planet class
class Planet

  attr_reader :name, :year_length, :distance_from_the_sun, :diameter_miles, :mass_EM, :named_moons

  # @@instances = []

  def initialize(name, year_length, distance_from_the_sun, diameter_miles, mass_EM, named_moons)
    @name = name
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @diameter_miles = diameter_miles
    @mass_EM = mass_EM
    @named_moons = named_moons
    # @@instances.push(self)
  end

  def read
    return "#{@name} is #{@distance_from_the_sun} AUs from the sun with a diameter of #{@diameter_miles} miles, a mass of #{@mass_EM} EMs. It has #{@named_moons} named moons and an orbital period of #{@year_length} earth years."
  end

  # def self.instances
  #   return @@instances
  # end

end

# define SolarSystem class
class SolarSystem

  attr_reader :age, :planets, :names

  def initialize(planets, age)
    @planets = planets
    @age = age
    namearray
  end

  def add(planet)
    @planets.push(planet)
    namearray
  end

  def list
    count = 1
    str = ""
    @planets.each do |planet|
      str += "#{count}. #{planet.name}"
      str += ", " if planet != @planets.last
      count +=1
    end
    return str
  end

  def namearray
    @names = []
    @planets.each do |planet|
      @names.push(planet.name.downcase)
    end
  end

  def year(planet)
    return (@age/planet.year_length).to_i
  end

end

# method to create a planet from user input
def new_planet
  puts "What is the planet's name?"
  name = gets.chomp.to_s
  puts "How many earth years is this planet's orbiting period?"
  year_length = gets.chomp.to_f
  puts "How many AUs from the sun is this planet?"
  distance_from_the_sun = gets.chomp.to_f
  puts "What is the diameter of this planet in miles?"
  diameter_miles = gets.chomp.to_f
  puts "What is this planet's mass?"
  mass_EM = gets.chomp.to_f
  puts "How many named moons does this planet have?"
  named_moons = gets.chomp.to_i
  Planet.new(name, year_length, distance_from_the_sun, diameter_miles, mass_EM, named_moons)
end

# method to return distance between two planets
def distance(planet1, planet2)
  if planet1.distance_from_the_sun > planet2.distance_from_the_sun
    distance = planet1.distance_from_the_sun - planet2.distance_from_the_sun
    return "#{planet1.name} is #{distance} AUs further from the sun than #{planet2.name}."
  elsif planet1.distance_from_the_sun < planet2.distance_from_the_sun
    distance = planet2.distance_from_the_sun - planet1.distance_from_the_sun
    return "#{planet2.name} is #{distance} AUs further from the sun than #{planet1.name}."
  else
    return "#{planet1.name} and #{planet2.name} are the same distance from the sun."
  end
end

# interact with the user (now a method)
def interact(solarsystem)
  prompt = %{Please select one of the following planets for a list of attributes. To add a planet, enter "add". To compare distances between two planets, enter "distance". To exit, enter "exit".}
  puts %{Welcome to the solar system app! #{prompt}}
  puts solarsystem.list
  user_planet = gets.chomp.to_s.downcase
  until user_planet == "exit"
    case
      when user_planet == "add"
        solarsystem.add(new_planet)
      when user_planet == "distance"
        puts "Enter your first planet."
        planet1 = gets.chomp.to_s.downcase
        puts "Enter your second planet."
        planet2 = gets.chomp.to_s.downcase
        if solarsystem.names.include?(planet1) && solarsystem.names.include?(planet2)
          # find the index of the planet in the array of planet names
          index1 = solarsystem.names.index(planet1)
          index2 = solarsystem.names.index(planet2)
          # get the planet object from the array of Planet instances
          planet1 = solarsystem.planets[index1]
          planet2 = solarsystem.planets[index2]
          puts distance(planet1, planet2)
        else
          puts "I'm sorry, I don't know both of those planets."
        end
        puts %{Let's do something else! #{prompt}}
      when solarsystem.names.include?(user_planet)
        puts solarsystem.names.class
        index = solarsystem.names.index(user_planet)
        planet = solarsystem.planets[index]
        puts "#{planet.read} The local year on #{planet.name} is #{solarsystem.year(planet)}"
        puts %{Let's look at another! #{prompt}}
      else
        puts %{I'm sorry, I didn't understand "#{user_planet}". #{prompt}}
    end
    puts solarsystem.list
    user_planet = gets.chomp.to_s.downcase
  end
  puts "Thanks for learning about the solar system!"
end
