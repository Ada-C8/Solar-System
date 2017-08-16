### METHODS ########################

def check_yes_no
  answer = gets.chomp
  until answer == "yes"|| answer == "no"
    puts "\nInvalid input. \n\nCreate planete?"
    answer = gets.chomp
  end
  return answer
end

def open_question(ask, number, yn, pos)
  puts ask
  answer = gets.chomp
  if number == true && pos == true
    until answer.to_i.to_s == answer && answer.to_i > 0
      puts "\nYou must enter a positive number."
      answer = gets.chomp
    end
  elsif number == true
    until answer.to_i.to_s == answer
      puts "\nYou must enter a number."
      answer = gets.chomp
    end
  elsif yn == true
    until answer.downcase == "yes" || answer.downcase == "no"
      puts "\nYou must answer yes or no."
      answer = gets.chomp
    end
  end
  return answer
end

def interact_with_ss
  puts "\nHi there, planets-lover!"

  earth = Planet.new("Earth", 365.5, 92.96, 3959, "yes", 58.3)
  mars = Planet.new("Mars", 687, 483.8, 4857, "no", -195)
  jupiter = Planet.new("Jupiter", 483.8, 432106, 58657, "yes", -145)
  saturn = Planet.new("Saturn", 1556, 888.2, 36184, "no", -288)
  venus = Planet.new("Venus", 225, 67.24, 3760, "no", 864)
  my_s_system = SolarSystem.new(earth, 1_000_000_000_000)
  my_s_system.add_planet(mars)
  my_s_system.add_planet(jupiter)
  my_s_system.add_planet(saturn)
  my_s_system.add_planet(venus)

  repeat = nil
  until repeat == false
    puts "\nWhat do you want to do?\n\n- See all planets > Type \"list\" \n- Add a planet > Type \"add\" \n- Delete a planet > Type \"delete\" \n- Distance between two planets > Type \"distance\" \n- Age of the Solar System's planets > Type \"age\" \n- Exit the Solar System > Type \"exit\"\n\n"
    print "Choice: "
    choice = gets.chomp.downcase
    case choice
    when "list"
      puts "\n=============================================\n"
      if my_s_system.numplanets == 0
        puts "\nYour Solar System is empty! Come back after creating a few planets."
        repeat = true
      else
        my_s_system.print
      end
      puts "\n=============================================\n\n"
      repeat = true
    when "add"
      puts "\n=============================================\n"
      new_planet = my_s_system.create_user_planet
      if new_planet == nil
        repeat = true
      else
        puts "\n\nDo you want to add your new planet to your Solar System ?"
        if check_yes_no == "yes"
          my_s_system.add_planet(new_planet)
          puts "\nYour planet was added!"
          repeat = true
        else
          puts "\nPlanet erased!"
          repeat = true
        end
      end
      puts "\n=============================================\n"
    when "delete"
      puts "\n=============================================\n"
      if my_s_system.numplanets == 0
        puts "You are a serial deleter, you have no planet left in your system!"
        repeat = true
      else
        puts "\nHere are all the planets in your system. \nWhich planet do you want to delete (type \"all\" to delete all the planets):"
        my_s_system.list_planets_names
        answer = gets.chomp
        my_s_system.supp_planet(answer)
        if my_s_system.numplanets == 0
          puts "\nYou have no planet left in your system!"
        end
        repeat = true
      end
      puts "\n=============================================\n"
    when "distance"
      if my_s_system.numplanets < 2
        puts "\nYou don't have enough planets in your system to compare their distances :( \n\nCome back when you have created more planets."
        repeat = true
      else
        puts "\nWhat are the two planets whose distance from each other you want to know?"
        distance1 = nil
        while distance1 == nil
          puts "\nPlanet 1: "
          planet1 = gets.chomp
          distance1 = my_s_system.distance_from_sun(planet1)
        end
        distance2 = nil
        while distance2 == nil
          puts "\nPlanet 2: "
          planet2 = gets.chomp
          while planet1 == planet2
            puts "\nChose a planet other than #{planet1}."
            puts "\nPlanet 2: "
            planet2 = gets.chomp
          end
          distance2 = my_s_system.distance_from_sun(planet2)
        end
        puts "\n=============================================\n"

        if distance1 > distance2
          puts "\nThe distance between #{planet1} and #{planet2} is #{distance1 - distance2} million of miles."
        elsif distance1 ==  distance2
          puts "\n#{planet1} and #{planet2} are equidistant from the sun."
        else
          puts "\nThe distance between #{planet1} and #{planet2} is #{distance2 - distance1} million of miles."
        end
      end
      puts "\n=============================================\n"
    when "age"
      puts "\n=============================================\n"
      my_s_system.planets_age
      puts "\n=============================================\n"
    when "exit"
      repeat = false
    else
      puts "\n=============================================\n"
      puts "\nInvalid input."
      repeat = true
      puts "\n=============================================\n"
    end
  end
  puts "\nOk. Bye."
end

### CLASSES ########################

class SolarSystem
  def initialize(planet, system_age)
    @planet = planet
    @planets = []
    @planets << @planet
    @system_age = system_age
  end

  def add_planet(new_planet)
    @planets << new_planet
  end

  def create_user_planet
    user_planet = []
    user_planet << open_question("\nWhat\'s your planet\'s name?", false, false, false)
    user_planet << open_question("\nWhat is its year length?", true, false, true)
    user_planet << open_question("\nHow far is it from the sun?", true, false, true)
    user_planet << open_question("\nWhat is its radius?", true, false, true)
    user_planet << open_question("\nDoes it have an atmosphere?", false, true, true)
    user_planet << open_question("\nWhat is its average temperature?", true, false, false)
    puts "\nCreate planet?"
    case check_yes_no
    when "yes"
      new_planet = Planet.new(user_planet[0], user_planet[1], user_planet[2], user_planet[3], user_planet[4], user_planet[5])
      puts "\nYour planete was created!\n"
      puts "\n=============================================\n"
      puts "\nHere's your planet's summary:\n\n"
      puts new_planet.planet_summary
      puts "\n=============================================\n"
      return new_planet
    when "no"
      puts "\nPlanet erased!"
      return nil
    end
  end

  def supp_planet(planet_name)
    found = nil
    deleted = nil
    if planet_name.downcase == "all"
      @planets.clear
      puts "\nAll the planets in your Solar System were deleted!"
    else
      @planets.each do |each_planet|
        if each_planet.name.downcase == planet_name.downcase
          @planets.delete(each_planet)
          found = true
          deleted = planet_name.capitalize
        end
      end
      found == true ? (puts "\nPlanet #{deleted} was deleted!") : (puts "\nPlanet #{planet_name.capitalize} is not part of the Solar System.")
    end
  end

  def print
    @planets.each do |each_planet|
      puts "\n" + each_planet.planet_summary
    end
  end

  def list_planets_names
    planet_list = ""
    @planets.each do |each_planet|
      if each_planet == @planets.last
        planet_list << "#{each_planet.name}."
      else
        planet_list << "#{each_planet.name}, "
      end
    end
    puts planet_list
  end

  def distance_from_sun(planet_name)
    found = nil
    distance = nil
    @planets.map do |each_planet|
      if each_planet.name.downcase == planet_name.downcase
        distance = each_planet.distance_from_the_sun.to_i
        found = true
      end
    end
    found == true ? (return distance) : (puts "\nPlanet #{planet_name.capitalize} is not part of the Solar System.")
    return distance
  end

  def numplanets
    @planets.size
  end

  def planets_age
    list_age = ""
    puts "\nHere is the local ages of the planets in the Solar System:"
    @planets.each do |each_planet|
      each_planet.age = (@system_age * 365.25 / each_planet.year_length.to_i / 1_000_000_000).ceil
      list_age << "- #{each_planet.name}: #{(@system_age * 365.25 / each_planet.year_length.to_i / 1_000_000_000).ceil} billion\n"
    end
    puts list_age
  end

end

class Planet
  attr_reader :name, :year_length, :distance_from_the_sun, :size, :atmosphere, :temperature, :planet_summary
  attr_writer :age
  def initialize(name, year_length, distance_from_the_sun, size, atmosphere, temperature)
    @name = name
    @year_length = year_length
    @distance_from_the_sun = distance_from_the_sun
    @size = size
    @atmosphere = atmosphere
    @temperature = temperature
    @age
  end
  def planet_summary
    return "#{@name}:\n#{@name}\'s year length is #{@year_length} days. \nIt\'s #{@distance_from_sun} million of miles from the sun and its radius is #{@size} miles. \nIt #{@atmosphere == "yes" ? "has" : "doesn't have"} an atmosphere and its average temperature is #{@temperature}F.\n"
  end
end


### CODE ########################

interact_with_ss
