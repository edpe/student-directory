require 'csv'
@students = [] # an empty array accessible to all methods


def initialise
  try_load_students
  interactive_menu
end


def input_students
  clear_screen
  cohort = :november
  bar
  puts "Please enter the names of the students".center(80)
  puts "To finish, just hit return twice".center(80)
  bar
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


def show_students
  clear_screen
  print_header
  print_student_list
  print_footer
  hit_enter
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
  puts "3. Save a list"
  puts "4. Load a list"
  puts "5. Read source code"
  puts "9. Exit" # 9 because we'll be adding more items
end


def make_choice(selection)
  case selection
    when "1"
    input_students
    when "2"
      show_students
    when "3"
      successful_selection("3. Save the list")
      save_students(choose_file("save"))
      action_complete("saved")
    when "4"
      successful_selection("4. Load a list")
      load_students(choose_file("load"))
      action_complete("loaded")
    when "5"
      successful_selection("Read Source Code")
      puts File.read(__FILE__)
      hit_enter
    when "9"
      puts "Exited!"
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


def choose_file(action)
  puts "Please enter file name to #{action} - Hit enter to select \"students.csv\" by default"
  filename = gets.chomp
  if filename.empty?
    filename = "students.csv"
  end
  return filename
end


def save_students(filename = "students.csv")
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
      end
    end
  puts "saving file as \"#{filename}\"...".center(80)
  puts
end


def load_students(filename = "students.csv")
  @students = []
  CSV.foreach(filename) do |line|
      name = line[0]; cohort = line[1]
      append_to_students(name, cohort)
    end
  load_message(filename)
end


def load_message(filename)
  puts bar
  puts "Loading #{@students.count} students from #{filename}...".center(80)
  puts bar
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

def successful_selection(selection)
  bar
  puts "You have selected #{selection}".center(80)
  bar
end


def action_complete(action)
  puts "file #{action}".center(80)
  puts
  hit_enter
end


def hit_enter
  puts "   Hit Enter to continue   ".center(80, "*")
  STDIN.gets.chomp
end


def bar
  puts "".center(80,"-")
end


def clear_screen
  system("clear")
end


initialise
