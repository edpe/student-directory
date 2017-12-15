
@students = [] # an empty array accessible to all methods

def input_students
  clear_screen
  cohort = :november
  bar
  puts "Please enter the names of the students".center(80)
  puts "To finish, just hit return twice".center(80)
  bar
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    append_to_students(name, cohort)
    puts "Now we have #{@students.count} students".center(80)
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    make_choice(STDIN.gets.chomp)
  end
end

def print_menu
  clear_screen
  bar
  puts "Student Directory Main Menu".center(80)
  bar
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  clear_screen
  print_header
  print_student_list
  print_footer
  puts "Hit Enter to return to main menu"
  STDIN.gets.chomp

end

def make_choice(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again".center(80)
  end
end

def print_header
  bar
  puts "The students of Villains Academy".center(80, "-")
  bar
  puts
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
    puts
  end
end

def print_footer
  bar
  if @students.count == 1
    puts "Currently, we have just #{@students.count} great student".center(80)
  elsif @students.count > 1

    puts "Overall, we have #{@students.count} great students".center(80)
  else
    puts "We currently have no students enrolled"
  end
  bar
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of Students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    append_to_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv"
    load_students(filename)# autoload students.csv
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def append_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def initialise
  try_load_students
  interactive_menu
end

def bar
  puts "".center(80,"-")
end

def clear_screen
  system("clear")
end

initialise
