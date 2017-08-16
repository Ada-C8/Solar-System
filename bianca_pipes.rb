##### Wave_1 #####

#create SolarSystem class

class SolarSystem

  #use @planets instance variable
  def initialize(planets)
    @planets = Array.new(planets)
  end

  #method to add planet to list

  def add(planet)
    @planet = planet
    @planets << planet
    return @planet
  end

  #method to return, not print list of planets as String
  def list
    num = 0
    planet_list = ""
    @planets.each do |planet|
      num += 1
      planet_list += "#{num}. #{planet}\n"
    end
    ## Not sure why return does not work here instead of puts ##
    puts planet_list
  end
end

milky_way = SolarSystem.new(milky_way)

milky_way.add("Mercury")
milky_way.add("Venus")
milky_way.add("Earth")

milky_way.list

milky_way.add("Hoth")

milky_way.list

class SolarSystem

def initialize(planets, planet_name, mass, orbit, tilt, rotation, num_of_moons)
  @planets = planets
  @planets = Hash.new
  @planet_name, @mass, @orbit, @tilt, @rotation, @num_of_moons  = planet_name, mass, orbit, tilt, rotation, num_of_moons
  @planets[:name] = planet_name
  @planets[:mass] = mass
  @planets[:orbit] = orbit
  @planets[:tilt] = tilt
  @planets[:rotation] = rotation
  @planets[:num_of_moons] = num_of_moons
end

def add_hash(planet_name, mass, orbit, tilt, rotation, num_of_moons)
  @planets[:name] = planet_name
  @planets[:mass] = mass
  @planets[:orbit] = orbit
  @planets[:tilt] = tilt
  @planets[:rotation] = rotation
  @planets[:num_of_moons] = num_of_moons
end

#return list of planets as string
def return_planets
  planet_hash = ""
  @planets.each do |key, value|
    planet_hash += "#{key}: #{value}\n"
  end
  puts planet_hash
end
end

milky_way = SolarSystem.new("milkyway", "Earth", 34, 5, 6, 7, 1)

milky_way.return_planets

####Wave_2 & Wave_3 #####

class SolarSystem

  #use @planets instance variable
  def initialize(planets)
    @planets = Array.new(planets)
  end

  #method to add planet to list
  def add(planet)
    @planet = planet
    @planets << planet
    return @planet
  end

  #create interface for user to interact with solar system
  #can select planet and view info about it

  def interact
    puts "What planet would you like to view and learn about?"
    planet = gets.chomp
    @planets.each do |series_of_planets|
      if series_of_planets == planet
        puts "#{planet.name}"
        puts "#{planet.weight}"
        puts "#{planet.size}"
        puts "#{planet.orbit}"
      else
        puts "Sorry, it appears that the planet you want is not available."
      end
    end
  end

  #method to return, not print list of planets as String
  def list
    num = 0
    planet_list = ""
    @planets.each do |planet|
      num += 1
      planet_list += "#{num}. #{planet.name}\n"
    end
    return planet_list
  end

  def planet_list_class
    full_list_planets = ""
    @planets.each do |full_list|
      full_list_planets += full_list.print_list
    end
    return full_list_planets
  end

  def view_planet
    puts "What planet would you like to learn about?"
    view_planet = gets.chomp

    @planets.each do |planet|
      name = "#{planet.name}"
      if view_planet == name
        puts "You would like to learn more about #{name}."
        puts "Name: #{planet.name}"
        puts "Weight: #{planet.weight}"
        puts "Size: #{planet.size}"
        puts "Orbit: #{planet.orbit}"
      end
    end
  end

  def add_planet
      puts "You have selected to add a planet."
      puts "Please type in the name of the planet."
      name = gets.chomp
      puts "Please type in the weight."
      weight = gets.chomp.to_i
      puts "Please type in the size."
      size = gets.chomp.to_i
      puts "Please type in the orbit."
      orbit = gets.chomp.to_i
      planet_array = Planet.new(name, weight, size, orbit)
      @planets <<  planet_array
  end
end

class Planet
  # Create reader methods to give a user access to read the instance variables.
  attr_reader :name, :weight, :size, :orbit

  def initialize(name, weight, size, orbit)
    @name = name
    @weight = weight
    @size = size
    @orbit = orbit
  end

  # Create a method that returns the Planet's attributes in an ###easy to read fashion.#
  def planet_table
    puts "%-30s%-30s\n%-30s%-30s\n" % ["Name: #{@name}", "Weight: #{@weight}", "Size: #{@size}", "Orbit: #{@orbit}"]
  end

  # When printing the planet list or planet details, it should call the corresponding method in Planet.
  def print_list
    list = "1. Name: #{@name}\n2. Weight: #{@weight}\n3. Size: #{@size}\n4. Orbit: #{@orbit}\n"
    return list
  end
end


jupiter = Planet.new("Jupiter", 23, 45, 673)
saturn = Planet.new("Saturn", 45, 67, 321)
earth = Planet.new("Earth", 34, 21, 456)
milky_way = SolarSystem.new([jupiter, saturn, earth])
puts milky_way.list

puts milky_way.planet_list_class

# user can add own planet
milky_way.add_planet
puts milky_way.list

milky_way.view_planet
