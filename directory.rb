def input_students
  students = []
  months = ["january",
            "february",
            "march",
            "april",
            "may",
            "june",
            "july",
            "august",
            "september",
            "october",
            "november",
            "december"]

  while true do
    puts "Please enter student name:"
    name = gets.slice(0..-2)
    if name.empty?
    name = "no name given"
  end
while true do
    puts "Please enter cohort:"
    cohort = gets.slice(0..-2).downcase


      if cohort.empty?
      cohort = "no recorded"
      break

      elsif !months.include?(cohort)
      puts "That doesn't seem to be a month I recognise, please try again or press enter twice to leave blank"

    else
      break
    end

end

if name == "no name given" && cohort == "no recorded"
  puts "no students added"
else
  students << {name: name, cohort: cohort.to_sym}
end

  puts "Now we have #{students.count} students"

  puts "Do you wish to add another student y/n?"
  choice = gets.slice(0..-2)
    if choice != "y"
    break
  end
  end
students
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "----------".center(80)
end

def print(students)
  #generates array of all cohorts
  cohort_array = students.map {|x| x.fetch(:cohort)}.uniq
  cohort_array.each do |cohort|
    puts students.select { |students| puts "#{students[:name]}, #{students[:cohort]} cohort".center(80) if students[:cohort] == cohort }
  puts
  end
end

def print_footer(names)
  if names.count == 0
  end
  if names.count == 1
  puts "Overall, we have #{names.count} great student"
else
  puts "Overall, we have #{names.count} great students"
end
end

def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end


  # 4. repeat from step 1
  end
end

interactive_menu
