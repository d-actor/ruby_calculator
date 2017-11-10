@memory = []

def main
  puts "----RUBY CALCULATOR----"
  puts "1) Do Calculation"
  puts "2) String Input"
  puts "3) Display Memory"
  puts "4) Quit"
  puts "Please make a selection:"
  selection = STDIN.gets.strip.to_i
end

def mainop
  puts "What is the first number?"
  first = STDIN.gets.strip.to_f
  puts "What is the operator?"
  op = STDIN.gets.strip
  case op
  when "+", "-", "*", "/", "**", "%"
    op.to_sym
    puts "What is the second number?"
    second = STDIN.gets.strip.to_f
    puts "Calculating..."
    @answer = first.send(op, second)
    puts @answer
    @memory << @answer
    puts "1)Continue\nor\n2)Clear?"
    opt = STDIN.gets.strip.to_i
    case opt
      when 1
      nextop
    end
    else
      puts "Invalid selection"
      mainop
  end
end

def nextop
  puts @answer
  puts "What is the operator?"
  op = STDIN.gets.strip
  case op
  when "+", "-", "*", "/", "**", "%"
    op.to_sym
    puts "What is the second number?"
    second = STDIN.gets.strip.to_f
    puts "Calculating..."
    @answer = @answer.send(op, second)
    puts @answer
    @memory << @answer
    puts "1)Continue\nor\n2)Clear?"
    opt = STDIN.gets.strip.to_i
    case opt
      when 1
        nextop
      end
    else
      puts "Invalid selection"
      nextop
  end
end

def calculate
  puts "Enter Calculation"
  calc = STDIN.gets.strip
  exp_operator = calc.scan(/\*{2}/)
   if exp_operator.length > 0
     operator = exp_operator
   else
     operator = calc.scan(/[\+\-\*\/]/)
   end
  numbers = calc.split(operator[0]).map(&:to_f)
  answer = numbers.reduce(operator[0].to_sym)
  puts answer
  @memory << answer
  puts "1)Continue\nor\n2)Clear?"
  continue = STDIN.gets.strip.to_i
  case continue
  when 1
    puts "OK"
    calculate
  end
end

def display_mem
  puts "Values in Memory: "
  puts @memory.join("\n")
  puts "Press ENTER to return to main menu: "
  key = STDIN.gets.strip
  if key != nil
  end
end

loop do
  case main
    when 1
      mainop
    when 2
      calculate
    when 3
      display_mem
    when 4
      puts "Goodbye!"
      break
    else
      puts "Invalid selection, try again"
  end
end
