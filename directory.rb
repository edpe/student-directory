def input_students
  students = []
  while true do
  puts "Please enter student name:"
    name = gets.chomp
    if name.empty? == true
      break

    else


  puts "Please enter student hobby:"
    hobby = gets.chomp
  puts "Please enter height(cm):"
    height = gets.chomp
  puts "Please enter nationality:"
    nationality = gets.chomp
  puts "To finish, just hit return twice"

    students << {name: name, hobby: hobby, height: height, nationality: nationality,  cohort: :november}
    puts "Now we have #{students.count} students"

end
end
students
end

def print_header
  puts "The Students of Villains Academy"
  puts "----------"

end

def print(students)
  students.each do |student|
  puts "name: #{student[:name]} \nhobby: #{student[:hobby]} \nheight: #{student[:height]} \nnationality: #{student[:nationality]} \ncohort:#{student[:cohort]}"
  puts
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
