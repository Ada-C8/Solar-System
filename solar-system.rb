# capitalizes each word, makes names of plants prettier
def titleize(x)
  "#{x.split.each{|x| x.capitalize!}.join(' ')}"
end

# solar system, returns list
class SolarSystem
  attr_reader :planets
  def initialize(planets)
    @planets = planets
  end

  def add_planet(name)
    @planets << name
  end

  def return_list # don't use puts! use return!
    list = ""
    @planets.each_with_index do |planet, i|
      list += "#{i+1}. #{titleize(planet.name)}\n" # pops into blank list var
    end
    return list
  end

  def view_solar_system
    list = ""
    @planets.each_with_index do |planet, i|
      list += planet.view_planet
    end
    return list
  end
end

# planet - compile planet data
class Planet
  attr_reader :name, :color, :size, :orbit, :number_of_moons

  def initialize(name, color, size, orbit, number_of_moons)
    # all the attributes to be entered, must be in order
    @name = name
    @color = color
    @size = size
    @orbit = orbit
    @number_of_moons = number_of_moons
  end

  def view_planet
    "#{titleize(name)}:\n#{titleize(color)} #{size} planet. #{orbit} rotations per its year. #{number_of_moons} moons.\n"
  end
end

# ----- Worker Bee System
# manually created planets with info
planet_girlie = Planet.new("Planet Girlie", "grey", "extra-large", 910, 4)
planet_suge = Planet.new("Planet Suge", "black", "small", 230, 4)
planet_finn = Planet.new("Planet Finn", "brown", "medium", 360, 2)
planet_kitty = Planet.new("Planet Kitty", "white", "small", 800, 1)

worker_bee_system = SolarSystem.new([planet_girlie, planet_suge, planet_finn, planet_kitty]) # array of planet classes

# ---- Welcome Screen
puts "Welcome to the Worker Bee System."
puts "Current documented planets are listed below:"
puts

while true # keeps going until exit
  # list planets!
  list = worker_bee_system.return_list
  puts list
  puts

  # ----- Main Screen
  puts "What would you like to do? Please enter A B C or D.\nA: View a planet's collected data.\nB: Enter data for new planet.\nC: View all current data.\nD: Exit."

  option = gets.chomp.downcase

  # ----- User Selection
  # let user select which planet they'd like to read about
  if option == "a"
    puts "\n----------\n\n"

    puts "Which planet would you like to view?"
    user_selection = gets.chomp.to_i
    display_selection = worker_bee_system.planets[user_selection-1]
    puts display_selection.view_planet
    if user_selection == 0
      puts "\n----------\n\n"
      puts "That is an invalid selection. Restarting program."
    end
  elsif option == "b"
    puts "\n----------\n\n"

    # new planet input
    puts "What is the name of the planet?"
    new_planet_name = gets.chomp
    puts "What color is it?"
    new_planet_color = gets.chomp
    puts "What size planet is it?"
    new_planet_size = gets.chomp
    puts "How many of its days is its orbit around the sun?"
    new_planet_orbit = gets.chomp.to_i
    puts "How many moons does it have?"
    new_planet_number_of_moons = gets.chomp.to_i

    # add the new planet
    new_planet = Planet.new(new_planet_name, new_planet_color, new_planet_size, new_planet_orbit, new_planet_number_of_moons)
    worker_bee_system.add_planet(new_planet)
    puts "Updated documented planets are listed below:"
  elsif option == "c" # view everything
    puts worker_bee_system.view_solar_system

  elsif option == "d"
    exit
  else
    puts "That isn't an available option.\n"
  end
  puts "\n----------\n\n"
end

