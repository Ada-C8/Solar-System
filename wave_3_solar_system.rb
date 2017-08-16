class SolarSystem
  attr_accessor :planets

  def initialize(planets)
    @planets = planets
  end

  def add_new_planet(new_planet)
    @planets << new_planet
  end

  def list
    i = 1
    return @planets.each do |planet|
        puts "#{i}. #{planet.name}\n"
        i += 1
    end
  end

# Create ability to output all details of a certain planet that is part of a certain universe
  def all_info(the_planet_i_care_about)
    return @planets.each do |each_planet_in_my_solar_system|
      if each_planet_in_my_solar_system.name == the_planet_i_care_about
        puts each_planet_in_my_solar_system.info
      end
    end
  end



end # end of class


class Planet

  attr_reader :name, :year_length, :distance_from_sun, :language, :inhabitants, :primary_export

  def initialize(name, year_length, distance_from_sun, language: "Meowish", inhabitants: "Cats", primary_export: "Catnip")
    @name = name
    @year_length = year_length
    @distance_from_sun = distance_from_sun
    @language = language
    @inhabitants = inhabitants
    @primary_export = primary_export
  end

  def info
    puts "PLANET INFO"
    puts "Name: #{@name}"
    puts "Length of Year: #{@length_of_year}"
    puts "Distance from the Sun: #{@distance_from_sun}"
    puts "Language: #{@language}"
    puts "Inhabitants: #{@inhabitants}"
    puts "Primary Export: #{@primary_export}"
  end

  def some_info(detail)
    return case detail
    when "name"
      name
    when "distance from the sun"
      distance_from_sun
    when "length of year"
      length_of_year
    when "inhabitants"
      inhabitants
    when "primary export"
      primary_export
    when "language"
      language
    end
  end

  def name
    return @name
  end

  def length_of_year
    return @length_of_year
  end

  def distance_from_sun
    return @distance_from_sun
  end

  def language
    return @language
  end

  def inhabitants
    return @inhabitants
  end

  def primary_export
    return @primary_export
  end

end #end of class

# Built-in planets & attributes
# initialize(name, year_length, distance_from_sun, language: "Meowish", inhabitants: "Cats", primary_export: "Catnip")
all_the_planets =
[
  Planet.new("Calicoa", "12", "1912000", language: "Purrese"),
  Planet.new("Sphynxtine", "37", "1853000", primary_export: "Pillows"),
  Planet.new("Longhairto", "67", "1950000", primary_export: "Hairballs"),
  Planet.new("Maineus", "41", "1969000")
]

# Create a Solar System that contains all the planets
cativerse = SolarSystem.new(all_the_planets)

# Welcome user & provide information
puts "\nWelcome to the Solar System & Planet Information System."
puts "Finally, the vast unknowableness of the universe is knowable."
puts "There is much to learn, but first...\n\n"

# Ask user if they want to create their own planet(s).
# Allow user to add their own planet

def create_planet(array_of_planets)
  puts "Tell us some information about your planet."
  print "Name: "
  name = gets.chomp
  print "Length of Year: "
  year_length = gets.chomp
  print "Distance from the Sun: "
  distance_from_sun = gets.chomp
  puts "We have found that most planets known to humankind share certain characteristics.  If the given information is true of your planet, type YES.  If its not, give us the correct information for your planet."
  puts "Language: Meowish"
  language = gets.chomp
    if language == "YES"
      language = "Meowish"
    else
      language = language
    end
  puts "Inhabitants: Cats"
  inhabitants = gets.chomp
  if inhabitants == "YES"
    inhabitants = "Cats"
  else
    inhabitants = inhabitants
  end
  puts "Primary Export: Catnip"
  primary_export = gets.chomp
  if primary_export == "YES"
    primary_export = "Catnip"
  else
    primary_export = primary_export
  end
  array_of_planets << Planet.new(name, year_length, distance_from_sun, language: language, inhabitants: inhabitants, primary_export: primary_export)
end

puts "I heard that you're quite the intrepid explorer."

answer = ""
until answer == "DONE"
  print "Do you have any planets to share information about? \nType YES if you'd like to share, type DONE if its top secret: "
  answer = gets.chomp.upcase
  if answer == "YES"
    create_planet(all_the_planets)
  elsif answer == "DONE"
    puts "\n\nWell, fine. The universe is probably too vast anyway.\n"
  else
    puts "You did not enter YES or DONE. You might be an extraterrestrial."
  end
end

# Allow the user to view information about individual planets

puts "\nAny interest in learning more about a certain planet? Here are all the planets we are currently authorized to share information about: "
cativerse.list

space_inquiry = ""
until space_inquiry == "DONE"
  print "\nEnter the planet you would like to learn more about.  When you're done, enter DONE: "
  space_inquiry = gets.chomp
  if space_inquiry == "DONE"
    puts "Okay, bye!"
    break
  else
    print "Would you like to know everything about that planet? YES or NO: "
    answer = gets.chomp
    if answer == "YES"
      cativerse.all_info(space_inquiry)
    else print "Okay.  Would you like to know the name, distance from the sun, length of year, inhabitants, primary export, or language? "
      detail = gets.chomp.downcase
      all_the_planets.each do
        i = 0
        if all_the_planets[i].name == space_inquiry
          puts all_the_planets[i].some_info(detail)
        end
        i += 1
      end
    end
  end
end
