class Person
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I Get it!"
  end
end

class Instructor < Person
  def teach
    puts "everything in ruby is an object!"
  end
end

# creating an instance of Instructor
chris = Instructor.new("Chris")

#calling greeting
chris.greeting

#creating instance of Student
christina = Student.new("Christina")
christina.greeting

#8
chris.teach

#calling the teach method on student doesn't work because the method is a local
#method to the class Instructor and will only work on instances created from
#the Insturctor class.
