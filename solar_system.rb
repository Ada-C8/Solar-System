#WAVE 3 BASIC

class Planet
  attr_reader :names, :diameter, :mass, :number_moons, :color

  def initialize(name, diameter, mass, number_moons, color)
    @name = name
    @diameter = diameter
    @mass = mass
    @number_moons = number_moons
    @color = color
  end

  def name
    return @name
  end

  def display_planets
    return "name: #{@name}, diameter: #{@diameter}, mass: #{@mass}, number of moons: #{@number_moons}, color: #{@color} \n"
  end
end

class Solar_system
  attr_reader :planets

  def initialize(planets)
    @planets = planets
  end

  def add_planet(planet)
    @planets << planet
  end

  def list_planets
    x = 0
    @planet_names = ""
    @planets.each do |planet|
      x+=1
      @planet_names << "#{x}. #{planet.name} \n"
    end
    return @planet_names
  end

  def make_planet_array
    @planet_array = []
    @planets.each do |planet|
      @planet_array << "#{planet.display_planets}"
    end
    return @planet_array
  end

  def show_planets(response)
    @response = response.to_i - 1
    if @response > @planet_array.length
      return "Please select a number displayed on the menu, idiot"
    end
    return @planet_array[@response]
  end
end


venus = Planet.new("Venus", 20, 45, 5, "red")
saturn = Planet.new("Saturn", 43, 23, 1, "yellow")
pluto = Planet.new("Pluto", 12, 21, 0, "blue")

milky_way = Solar_system.new([venus, saturn, pluto])
puts "which planet would you like to learn more about? Input 1, 2, or 3"
milky_way.make_planet_array
puts milky_way.list_planets
response = gets.chomp
puts milky_way.show_planets(response)

#ADD A PLANET
puts "Would you like to enter a planet? Enter Y or N"
wants = gets.chomp

if wants == "Y" || wants == "y"
  puts "Enter a name"
  enter_name = gets.chomp
  puts "Enter a diameter"
  enter_diameter = gets.chomp.to_i
  puts "Enter a mass"
  enter_mass = gets.chomp.to_i
  puts "Enter a number of moons"
  enter_moons = gets.chomp.to_i
  puts "Enter a color"
  enter_color = gets.chomp

  newplanet = Planet.new(enter_name, enter_diameter, enter_mass, enter_moons, enter_color)
  milky_way.add_planet(newplanet)

end
