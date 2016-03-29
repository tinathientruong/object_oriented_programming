
class Rover
  attr_accessor :coord_x, :coord_y, :direction
  attr_reader :plateau_x, :plateau_y
  def initialize(coord_x, coord_y, direction, plateau_x, plateau_y)
    @coord_x = coord_x.to_i
    @coord_y = coord_y.to_i
    @direction = direction.to_s
    @plateau_x = plateau_x.to_i
    @plateau_y = plateau_y.to_i
  end

 def read_instructions(instructions)
   instructions.upcase.chars.to_a.each do |instruction|
      if instruction == "M"
         if @coord_x.between?(0,@plateau_x ) && @coord_y.between?(0, @plateau_y)
             self.move
           else
             puts "Your rover is out of bounds! Please enter new coordinates"
             exit
           end
      elsif instruction == "L" || instruction == "R"
          self.turn(instruction)
       else
          puts "Invalid input. Please select either 'M' for move or 'R'/'L' for rotate."
     end # end of if
   end # end of each method
end #end of read_instructions method

def move
    case @direction
    when "N"
      @coord_y += 1
    when "S"
      @coord_y -= 1
    when "E"
      @coord_x += 1
    else
      @coord_x -= 1
    end #end of case
end # end of move method

def turn(orientation)
  if  orientation == "R"
    case @direction
    when "N"
        @direction = "E"
    when "E"
        @direction = "S"
    when "S"
      @direction = "W"
    else
      @direction = "N"
    end

  elsif orientation == "L"
     case @direction
     when "N"
        @direction = "W"
     when "E"
        @direction = "N"
     when "S"
       @direction = "E"
     else
       @direction = "S"
     end
   end #end of if
end # end of turn method

def output
  puts "#{@coord_x} #{@coord_y} #{@direction}"
end


end # end of Rover class

puts "Please enter size of plateau. (ex. 3 5 where 3 is width and 5 is length)"
  plateau_size_input = gets.chomp.split(" ")
  @plateau_x= plateau_size_input[0]
  @plateau_y = plateau_size_input[1]

  puts"#{plateau_size_input}"

puts "Please enter initial coordinates and direction of Rover 1 (Ensure there are spaces in between)"
 initial_position = gets.chomp.upcase.split(" ")
rover1 = Rover.new(initial_position[0].to_i,initial_position[1].to_i,initial_position[2],plateau_size_input[0], plateau_size_input[1])

 puts "Please enter instructions for movement (Select either 'M' for move or 'R'/'L' for rotate.)"
incoming_instructions = gets.chomp
 rover1.read_instructions(incoming_instructions)

 puts "Please enter initial coordinates and direction of Rover 2 (Ensure there are spaces in between)"
  initial_position = gets.chomp.upcase.split(" ")
 rover2 = Rover.new(initial_position[0].to_i,initial_position[1].to_i,initial_position[2],plateau_size_input[0], plateau_size_input[1])

  puts "Please enter instructions for movement (Select either 'M' for move or 'R'/'L' for rotate.)"
 incoming_instructions = gets.chomp
  rover2.read_instructions(incoming_instructions)

rover1.output
rover2.output
