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
    name = gets.chomp
    puts "Please enter cohort:"
    cohort = gets.chomp.downcase

      if name.empty?
      name = "noname"
    end

    while true do
      if cohort.empty?
      cohort = "nocohort"
      elsif !months.include?(cohort)
      puts "Cohort not found, please try again"
      cohort = gets.chomp
     else break
  end
end

  students << {name: name, cohort: cohort.to_sym}

  puts "Now we have #{students.count} students"

  puts "Do you wish to add another student y/n?"
  choice = gets.chomp
    if choice != "y"
    break
  end

  end
students
end

def print_header
  puts "The Students of Villains Academy"
  puts "----------"

end

def print(students)
  students.each_with_index do |student, index|
  puts "#{(index + 1)}. name: #{student[:name]}".center(20) + " cohort: #{student[:cohort]}".center(10)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
