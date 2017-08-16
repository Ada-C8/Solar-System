class Solar_system
  attr_reader :planets

  def initialize(planets)
    @planets=planets
  end

  def adding(extra)
     @planets << extra
     return @planets
   end

   def see
     info = []
     @planets.each do |m|
       info << m.easy_read
     end
     return info
   end

end

class Planet

  attr_reader :name, :distance_sun, :year_length, :radius, :satellites

  def initialize(name, distance_sun, year_length, radius, satellites)
    @name = name
    @distance_sun = distance_sun
    @year_length = year_length
    @radius = radius
    @satellites = satellites
  end

  def easy_read
    return "#{@name.capitalize}
            Distance from Sun: #{@distance_sun}
            Length of a year: #{@year_length}
            Radius: #{@radius}
            Satellites: #{@satellites}"
  end
end

def creating_planet
  puts "What is the name of the planet you want to enter? "
  user_name=gets.chomp

  puts "What is its distance to the sun?"
  user_distance = gets.chomp

  puts "What is its year length?"
  user_year=gets.chomp

  puts "What is its radius?"
  user_radius=gets.chomp

  puts "How many satellites it has?"
  user_satellites = gets.chomp

  user_planet = Planet.new(user_name, user_distance, user_year, user_radius, user_satellites)

  return user_planet
end

def see_information(planetlist)
  puts "This are the planets that we have so far"
  i = 1
  planetlist.each do |m|
    puts "#{i} #{m.name} "
    i +=1
  end
  puts "Enter the number of the planet that you want to learn about"
  selec = gets.chomp.to_i
  puts planetlist[selec-1].easy_read

end




mercury = Planet.new("Mercury", "35.98 million miles", "88 days", "1516 miles", 0)
venus = Planet.new("Venus", "67.24 million miles", "225 days", "3760 miles", 0)
earth = Planet.new("Earth", "92.96 million miles" ,"365 days", "3959 miles", 1)

planets_to_store = [mercury, venus, earth]

my_solarsystem= Solar_system.new(planets_to_store)






decision = 0

while decision != 1 && decision != 2 && decision!= 3 do
  puts "If you want to see information about a planet press 1, \nif you want to enter a planet press 2, \nif you want to exit press 3."
  decision = gets.chomp.to_i

  if decision == 1
    see_information(planets_to_store)
    puts "If you want to continue please press 0, otherwise press 3"
    decision = gets.chomp.to_i
    if decision == 3
      puts "Bye, have a good day."
    end

  elsif decision == 2

    planets_to_store << creating_planet
    puts my_solarsystem.see
    puts "If you want to continue please press 0, otherwise press 3"
    decision = gets.chomp.to_i
    if decision == 3
      puts "Bye, have a good day."
    end

  elsif decision == 3
    puts "Bye, have a good day."
  end
end
