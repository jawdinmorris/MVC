class StatsModel
  def initialize
    @numbers = []
  end

  def store(values)
    # values.each { |x| @numbers.push(x)}
     values.each do |num|
       @numbers.push(num)
     end
  end

  def get
    @numbers.sort
  end

   def average
     @numbers.sum / @numbers.length
   end

end

class StatsView
  def greeting
    puts "Welcome to my awesome stats app!"
  end

  def menu
    choice = 0
    while choice <1 || choice > 4
      puts "--------------------"
      puts "MAIN MENU"
      puts "--------------------"
      puts "1. Insert numbers"
      puts "2. List numbers"
      puts "3. Show average"
      puts "4. Quit"
      puts "--------------------"
      choice = gets.chomp.to_i
    end
    choice
  end

 def read_numbers
   values = []
   puts "Please enter numbers, one per line. Enter -1 to quit"
   num = gets.chomp.to_i
  while num !=-1 do
    values.push num
    num = gets.chomp.to_i
  end
   values
 end

 def display(numbers)
   puts "The numbers are: #{numbers.inspect}."
 end

 def show_average(avg)
   puts "The average is #{avg}."
 end
end

class StatsController
  def initialize
    @StatsModel = StatsModel.new
    @StatsView = StatsView.new
  end

 def run
   @StatsView.greeting
   the_choice = @StatsView.menu
   puts the_choice

    until the_choice ==4
    case the_choice
    when 1
      numbers =  @StatsView.read_numbers
      @StatsModel.store(numbers)
    when 2
      numbers = @StatsModel.get
      @StatsView.display(numbers)
    when 3
      avg = @StatsModel.average
      @StatsView.show_average(avg)
    end
    the_choice = @StatsView.menu
   end
   puts "Quitting now.."
  end
end


# Main entry point
sc = StatsController.new
sc.run
