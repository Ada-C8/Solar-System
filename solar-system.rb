class SolarSystem
  attr_accessor :system
  # Get array of Planets
  def initialize(planets)
    @solar_system = planets
  end

  # Show an initial menu of Planets from which to choose
  def show_menu
    planet_list = ""
    i = 1
    @solar_system.length.times do |n|
      planet_list << "\n#{i}. #{@solar_system[n].name}"
      i += 1
    end
    return "\nPlanet List#{planet_list}\nOther: Exit\n\n"
  end

  # Show the selected planet's information
  def show_planet(number)
    selected = @solar_system[number-1]

    # Calculate planet related ages
    age = 4.5e9/(selected.rotation_time/12.0)
    age = age.to_i.to_s
    age = age.reverse.scan(/\d{3}|.+/).join(",").reverse

    # Calculate the closest neighboring planets
    # Collect names and distances of planets
    distance_and_name = []
    @solar_system.length.times do |i|
      planet_info = {}
      planet_info[:name] = @solar_system[i].name
      planet_info[:distance] = @solar_system[i].distance_from_the_sun
      distance_and_name << planet_info
    end
    # Get only the distances and sort them
    planet_distances = []
    @solar_system.each do |planet|
      planet_distances << planet.distance_from_the_sun
    end
    ordered_planets = planet_distances.sort
    number_index = ordered_planets.index(selected.distance_from_the_sun).to_i

    # Find the select planet's distance neighbors (2)
    if (number_index+1) == @solar_system.length
      neighbor1_distance = 0
      neighbor1_difference = 0
    else
      neighbor1_distance = ordered_planets[(number_index+1)]
      neighbor1_difference = (selected.distance_from_the_sun - neighbor1_distance).abs.round(2)
    end
    if (number_index-1) < 0
      neighbor2_distance = 0
      neighbor2_difference = 0
    else
      neighbor2_distance = ordered_planets[(number_index-1)]
      neighbor2_difference = (selected.distance_from_the_sun - neighbor2_distance).abs.round(2)
    end
    neighbor1_name = ""
    neighbor2_name = ""
    distance_and_name.each do |planet|
      if neighbor1_distance == planet[:distance]
        neighbor1_name << planet[:name]
      end
      if neighbor2_distance == planet[:distance]
        neighbor2_name << planet[:name]
      end
    end
    if neighbor1_distance == 0 && neighbor2_distance == 0
      true_neighbor = "not to be found"
      true_distance = "both infinity and negative infinity"
    elsif neighbor1_distance == 0 && neighbor2_distance > 0
      true_neighbor = neighbor2_name
      true_distance = neighbor2_difference
    elsif neighbor2_distance == 0 && neighbor1_distance > 0
      true_neighbor = neighbor1_name
      true_distance = neighbor1_difference
    else
      true_neighbor = "#{neighbor2_name} and #{neighbor1_name}"
      true_distance = "#{neighbor2_difference} and #{neighbor1_difference}"
    end

    # Text summary shown to user
    text = "\nThe planet \[#{selected.name}\] is #{selected.distance_from_the_sun} Astronomical Units from the sun.
    \rThe closest neighboring planet(s) is/are #{true_neighbor}, which is/are #{true_distance} AU away.
    \rIt orbits the sun once every #{selected.rotation_time} Earth months, or #{(selected.rotation_time/12.0).round(2)} Earth years.
    \rSince our sun is 4.5 billion Earth years old, this planet's age is #{age}!
    \r#{selected.name} also enjoys #{selected.moon_count} moon(s) orbitin' around it.\n"
    return text
  end
end

class Planet
  attr_accessor :name, :distance_from_the_sun, :rotation_time, :moon_count
  # Get attributes for Planet
  def initialize(name, distance_from_the_sun, rotation_time, moon_count)
    @name = name
    @distance_from_the_sun = distance_from_the_sun
    @rotation_time = rotation_time
    @moon_count = moon_count
  end
end

# Methods to get user input for each Planet
def add_planet
  planet = Planet.new(get_planet_name, get_planet_distance, get_planet_rotation, get_planet_moons)
  return planet
end
def get_planet_name
  puts "\nEnter a new planet name."
  p_name = gets.chomp.capitalize
  return p_name
end
def get_planet_distance
  puts "Enter its distance from the sun in Astronomical Units."
  p_distance = gets.chomp.to_f
  return p_distance
end
def get_planet_rotation
  puts "Enter how many Earth months it takes to rotate around the sun."
  p_rotate = gets.chomp.to_i
  return p_rotate
end
def get_planet_moons
  puts "Enter the number of its moons."
  p_moons = gets.chomp.to_i
  return p_moons
end

# Create intial available menu of selections
planet_menu = [
  { name: "Mercury",
    distance: 0.39,
    rotation: 3,
    moons: 0
  },
  { name: "Venus",
    distance: 0.723,
    rotation: 7,
    moons: 0
  },
  { name: "Earth",
    distance: 1.0,
    rotation: 12,
    moons: 1
  },
  { name: "Mars",
    distance: 1.524,
    rotation: 23,
    moons: 2
  },
  { name: "Jupiter",
    distance: 5.203,
    rotation: 142,
    moons: 67 }
]

# Add the above information into the Solar System
planets_menu = []
planet_menu.each do |planet|
  info = planet.values
  planet_selection = Planet.new(info[0], info[1], info[2], info[3])
  planets_menu << planet_selection
end
ss = SolarSystem.new(planets_menu)

# Loop through program
loop do
  # Select menu option
  puts "\nChoose a number to learn more about that planet."
  all_planets = ss.show_menu
  puts all_planets
  planet_no = gets.chomp.to_i

  # Show user query decision
  if planet_no > 0 && planet_no <= planets_menu.length
    selected_planet = ss.show_planet(planet_no)
    puts selected_planet
    # Ask for a new planet
    puts "\nWould you like to add a new planet? (Enter Y or N)"
    add_decision = gets.chomp.upcase
    until add_decision == "Y" || add_decision == "N"
      puts "Sorry, that's a weird answer."
      puts "\nWould you like to add a new planet? (Enter Y or N)"
      add_decision = gets.chomp.upcase
    end
    if add_decision == "Y"
      new_planet = add_planet
      planets_menu << new_planet
      ss = SolarSystem.new(planets_menu)
      puts "Beautiful! We added your planet!"
    elsif add_decision == "N"
      puts "No problem."
    end
  else
    puts "Thanks for learning with us!"
    break
  end
end
