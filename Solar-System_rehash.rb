# Solar System Class
class SolarSystem
  # reader,writer methods
  attr_reader :planets, :age

  # Constructor
  def initialize(planet_array, age: 2017)
    @planets = planet_array
    @age = age
  end

  # Add new planet method
  def add_planet(new_planet)
    @planets << new_planet
  end

  # Return a pretty list of planets
  def list_planets
    n = @planets.length
    planet_array = @planets
    return_list = ""
    n.times do |i|
      return_list += "#{i+1}.  #{planet_array[i].name}\n"
    end
    return return_list
  end

  # OLD: Prints individual planet information
  # def print_planet(num)
  #   hash_to_print = planets[num]
  #   hash_to_print.each do |key,value|
  #     puts "#{key.to_s.tr('_',' ').capitalize}: #{value}"
  #   end
  # end

end # end of SolarSystem class

#Planet class
class Planet
  #reader methods
  attr_reader :name,:year_length,:distance_from_the_sun, :size, :number_of_moons

  #Constructor
  def initialize(name,year,distance,size,moons)
    @name = name
    @year_length = year
    @distance_from_the_sun =  distance
    @size =  size
    @number_of_moons = moons
    @planet_hash = {
      name: @name,
      year_length: @year_length,
      distance_from_the_sun: @distance_from_the_sun,
      size: @size,
      number_of_moons: @number_of_moons
    }
  end

  # Print pretty output
  def print_planet
    @planet_hash.each do |key,value|
      puts "#{key.to_s.tr('_',' ').capitalize}: #{value}"
    end
  end

end # end planet class

# checks if input data is zero
def check_input(num)
  if num.zero?
    print "Please enter a number > 0: "
    num = check_input(gets.chomp.to_f)
  else
    return num
  end
end

# User input method to make new planet
def make_planet(solarsystem_list)
  in_system = true
  while in_system == true
    print "Planet name: "
    response_name = gets.chomp
    solarsystem_list.planets.each do |check_planet|
      if check_planet.name.upcase == response_name.upcase
        puts "Already in our system!"
        in_system = true
        break
      else
        in_system = false
      end
    end
  end
  puts "Length of time to go around the sun? "
  year = check_input(gets.chomp.to_f)
  puts "Distance from the sun? "
  distance = check_input(gets.chomp.to_f)
  puts "Size? "
  size = check_input(gets.chomp.to_i)
  puts "Number of moons? "
  moons = gets.chomp.to_i
  return Planet.new(response_name,year,distance,size,moons)
end

# method to calculate planet distances
def planet2planet(planet1,planet2)
  return (planet1.distance_from_the_sun - planet2.distance_from_the_sun).abs.round(1)
end

# method to find planet age
def local_year(planet, solarsystem)
  return (solarsystem.age/planet.year_length).round(2)
end

# method to decide planet through input
def planet_choice(solarsystem)
  user_input = gets.chomp.to_i
  while user_input > solarsystem.planets.length || user_input < 1
    print "Please try again: "
    user_input = gets.chomp.to_i
  end
  return user_input
end

# initialize planets
Saturn = Planet.new("Saturn",0.45,888.6,74_600,62)
Mercury = Planet.new("Mercury",87.96,36,3_031,0)
Venus = Planet.new("Venus",243,67.2,7_521,0)
Pluto = Planet.new("Pluto",6.39,3674.5,1_413,4)

# initialize SolarSystem
averi_planets = SolarSystem.new([Venus,Mercury,Saturn], age: 10000)
# test add planets
averi_planets.add_planet(Pluto)
averi_planets.add_planet(Planet.new("Uranus",0.72,2794,32600,27))

# user input script
puts "Welcome to the Planet Encyclopedia!"
run_again = true
while run_again
  puts "TABLE OF CONTENTS\n-----------------"
  puts averi_planets.list_planets
  puts "-----------------"
  puts "What would you like to do?"
  puts "1. Learn about a planet\n2. Add another planet\n3. Find the distance between two planets\n\n"
  print "Option Number? "
  user_reply = gets.chomp.to_i
  while user_reply > 3 || user_reply < 1 # check option choice
    print "Please try again: "
    user_reply = gets.chomp.to_i
  end
  # choose option
  case user_reply
  when 1 # learn about a planet
    puts "Which planet would you like to learn about?"
    print "Go to: "
    user_input = planet_choice(averi_planets)
    puts ""
    averi_planets.planets[user_input-1].print_planet
    puts "Age: #{local_year(averi_planets.planets[user_input-1],averi_planets)}"
  when 2 # make a planet
    averi_planets.add_planet(make_planet(averi_planets))
    puts "Here's your entry!"
    averi_planets.planets[-1].print_planet
    puts "Age: #{local_year(averi_planets.planets[-1],averi_planets)}"
  when 3 # find distance
    print "Planet 1? "
    p1 = planet_choice(averi_planets)
    print "Planet 2? "
    p2 = planet_choice(averi_planets)
    dist = planet2planet(averi_planets.planets[p1-1],averi_planets.planets[p2-1])
    puts "Absolute distance between #{averi_planets.planets[p1-1].name} and #{averi_planets.planets[p2-1].name} is #{dist}"
  else
    puts "something is broken :("
  end
  # rerun options
  puts "\nWould you like to choose another option? (yes or no?)"
  run_again_reply = gets.chomp
  if run_again_reply == "yes"
    run_again = true
  elsif run_again_reply == "no"
    run_again = false
    puts "Ok, Bye!"
  else
    run_again = false
    puts "I can't understand :( Bye!"
  end
end


# end script
