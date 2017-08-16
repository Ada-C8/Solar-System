class Planet
  attr_accessor :name, :diameter, :orbit, :day, :moons, :distance_from_the_sun
  attr_reader :greatwall_compare

  def initialize(name, diameter, orbit, day, moons, distance_from_the_sun)
    @name = name
    @diameter = diameter
    @orbit = orbit
    @day = day
    @moons = moons
    @distance_from_the_sun = distance_from_the_sun
    @greatwall_compare = greatwall_compare
  end

  # When you are tired of reading the word planets, spaceorbs
  def spaceorbs_details
    puts "\nLet's get to know #{@name}."
    puts "It has #{@moons} moons and its diameter is #{@diameter} miles!"
    puts "A year is #{@orbit} Earth days. A day is #{@day} hours."
    puts "Its pretty far away from the sun, #{@distance_from_the_sun} miles!"
    puts comparison
  end

  # Attr_reader
  def comparison
    greatwall = 5500
    difference = @distance_from_the_sun / greatwall
    puts "Its distance from the sun is like #{difference} Great walls."
  end

  def return_spaceorbs
    summary = "
    Name: #{@name}
    Diameter: #{@diameter}
    Orbit: #{@orbit}
    Day: #{@day}
    Moons: #{@moons}
    Sun distance: #{@distance_from_the_sun}
    "
    return summary
  end
end


class SolarSystem
  attr_accessor :planets

  def initialize(input_planets)
    @planets = input_planets
  end

  # User adds a planet
  def add_planets()
    puts "Name of planet:"
    name = gets.chomp
    puts "Diameter? (in miles)"
    diameter = gets.chomp
    puts "Year length? (in Earth days)"
    orbit = gets.chomp
    puts "Day length? (in Earth hours)"
    day = gets.chomp
    puts "Number of moons?"
    moons = gets.chomp
    puts "Distance from sun? (in miles)"
    distance_from_the_sun = gets.chomp.to_i

    new_planet = Planet.new(name, diameter, orbit, day, moons, distance_from_the_sun)
    @planets << new_planet
  end

  # Numbered planet list return
  def return_planets
    new_array = []
    @planets.each_index do |i|
      new_array << (i + 1).to_s + ". " + @planets[i].name.to_s
    end
    return new_array.join("\n")
  end

  # User interface, loops until 'exit' or 'n'
  def user_choice
    puts "\nChoose a planet you would like to learn more about:"
    puts "1. Mercury 2. Venus 3. Earth 4. Mars\n5. Jupiter 6. Saturn 7. Uranus 8. Neptune\n9. Add new 10. Exit\n\n"

    user_answer = gets.chomp.capitalize

    case user_answer
    when "Exit"
      puts "Goodbye!"
      exit
    when "Add new"
      add_planets()
      puts @planets.last.spaceorbs_details
    else
      @planets.each_index do |i|
        if user_answer == @planets[i].name
          puts @planets[i].spaceorbs_details
        end
      end
    end

    puts "Go again? y/n"
    again = gets.chomp.upcase

    if again == "Y"
      user_choice
    else
      puts "Goodbye!"
      exit
    end
  end

end

# Name, diameter, year/orbit, day, moons, distance_from_the_sun
Mercury = Planet.new("Mercury", 3031, 88, 58.6, 0, 57900000)
Venus = Planet.new("Venus", 7521, 225, 241, 0, 108160000)
Earth = Planet.new("Earth", 7626, 365.24, 24, 1, 149600000)
Mars = Planet.new("Mars", 4217, 687, 24.5, 2, 227936640)
Jupiter = Planet.new("Jupiter", 86881, 4346, 9.8, 66, 778369000)
Saturn = Planet.new("Saturn", 74900, 10775, 10.5, 62, 1427034000)
Uranus = Planet.new("Uranus", 31763, 30680, 18, 27, 2870658186)
Neptune = Planet.new("Neptune", 30775, 60264, 19, 14, 4496976000)

all_planets = [Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune]

milky_way_array = SolarSystem.new(all_planets)

milky_way_array.user_choice
milky_way_array.return_planets
