class SolarSystem
	def initialize (all_planets)
		@all_planets = all_planets
	end

	def print_planets 
		return @all_planets
	end
	
	def planets
		return @all_planets	
	end

	def add
		puts "What planet do you want to add?\n"
		new_planet = gets.chomp
		@planets << new_planet
	end

class Planet
	attr_accessor :name, :color, :surface
	
	def initialize (name, color, surface)
	@name = name
	@color = color
	@surface = surface
	end

	def return_att
		puts "Planet Name: #{name}\nPlanet Color: #{color}\nPlanet Surface: #{surface}"
	end
	
	def planets
	return @all_planets
	end
end

earth = SolarSystem.new("Earth", "Blue", "Waters and Rocks")
mars = SolarSystem.new("Mars", "Red", "Rocky")
venus = SolarSystem.new("Venus", "Green", "Granitic Rock")

all_planets = [earth, mars, venus].add

puts earth.return_att
puts mars.return_att
puts venus.return_att
