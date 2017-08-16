class SolarSystem
	def initialize (all_planets)
		@all_planets = all_planets
	end

	def print_planets 
		return @all_planets
	end
	
	# def planets
	# 	return @all_planets	
	# end

end

class Planet
	attr_accessor :name, :color, :surface
	
	def initialize (name, color, surface)
	@name = name
	@color = color
	@surface = surface
	@all_planets = {}
	end

	def return_att
	count = 1
	puts "\n#{count} Planet Name: #{name}\n#{count+1} Planet Color: #{color}\n#{count+2} Planet Surface: #{surface}"
	
	end

	def store (key)
		@all_planets = {key => [@name, @color, @surface]}
	end

	def add
	puts "What planet do you want to add?\n"
	new_planet = gets.chomp
		@all_planets << new_planet
	end
	
	# def planets
	# return @all_planets
	# end
end

earth = Planet.new("Earth", "Blue", "Waters and Rocks")
mars = Planet.new("Mars", "Red", "Rocky")
venus = Planet.new("Venus", "Green", "Granitic Rock")

all_planets = [earth, mars, venus]

puts earth.store("earth")
puts mars.store("mars")
puts venus.store("venus")

puts earth.return_att
puts mars.return_att
puts venus.return_att

# puts mars.return_att
# puts venus.return_att


