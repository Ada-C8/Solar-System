class Solarsystem
attr_reader :planets

  def initialize(planets)
    @planets = planets
    # puts @planets
  end

  # method to create a new planet and push into planet array.
  def add_planet_to_solar_system(add_planet)
    @planets << add_planet
  end

  # method to print planets array after the new planet has been created and added to the planet array.
  def print_planets
    #  counter = 1
     @planets.each do |planet|
       puts "#{planet.name}"
      #  counter +=1
     end
  end
end

class Planet
  attr_reader :name, :year_length, :color, :rings, :inhabited, :distance_from_sun

  def initialize(input_name, year_length, input_color, input_rings, input_inhabited, input_distance_from_sun)
    @name = input_name
    @year_length = year_length
    @color = input_color
    @rings = input_rings
    @inhabited = input_inhabited
    @distance_from_sun = input_distance_from_sun
  end

  # method that returns the Planet's attributes in an easy to read fashion.
  def print_attributes
    puts "
    Planet Name: #{@name}
    Year Length: #{@year_length}
    Planet Color: #{@color}
    Rings: #{@rings}
    Inhabited: #{@inhabited}
    Distance from Sun: #{@distance_from_sun}"
  end

end

mercury = Planet.new("Mercury", 88, "yellow", "no", "no", 10)
venus = Planet.new("Venus", 225, "yellow", "no", "maybe", 20)
earth = Planet.new("Earth", 365, "blue", "no", "yes", 30)
mars = Planet.new("Mars", 687, "red", "no", "maybe", 40)
jupiter = Planet.new("Jupiter", 12, "orange", "no", "no", 50)
hoth = Planet.new("Hoth", 10, "gray", "no", "...It's Ice", 1000)


planet_array = [mercury, venus, earth, mars, jupiter, hoth]

new_system = Solarsystem.new(planet_array)

new_system.print_planets

x = 0
until x >= 1
  puts "\nPlease select a planet from the list above or type \"new\" to create your own. "
  puts "If youre not interested, type \"exit\"\n\n"
  user_input = gets.chomp.capitalize

  puts "\n"

  if user_input == "New"
    print "Planet Name: "
    input_name = gets.chomp
    print "Year Length: "
    year_length = gets.chomp
    print "Planet Color:"
    input_color = gets.chomp
    print "Does the planet have Rings: "
    input_rings = gets.chomp
    print "Inhabited: "
    input_inhabited = gets.chomp
    print "Distance from the sun (in miles): "
    input_distance_from_sun = gets.chomp

    puts "\n"

    new_planet = Planet.new(input_name, year_length, input_color, input_rings,input_inhabited, input_distance_from_sun)

    new_system.add_planet_to_solar_system(new_planet)

    new_system.print_planets

  elsif user_input == "Exit"
      x += 1
  else
    new_system.planets.each do |planet|
      if user_input == planet.name
        print planet.print_attributes
      end
    end
  end
end
