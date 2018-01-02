
class User
	attr_accessor :name
	def initialize(name)
		@name = name
	end

	def sayHi
		puts "hi#{@name}"
	end
end

tom = User.new("Tom")
tom.sayHi
tom.name = "aaa"
tom.sayHi