def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

def print_header
  puts "The Students of Villains Academy"
  puts "----------"
end

def print(students)
  counter = 0
  while counter < students.count

  puts "#{students[counter].fetch(:name)}"
  counter += 1
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
