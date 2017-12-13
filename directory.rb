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
    puts "Please enter cohort:"
    cohort = gets.slice(0..-2).downcase

      if name.empty?
      name = "noname"
    end

    while true do
      if cohort.empty?
      cohort = "nocohort"
      elsif !months.include?(cohort)
      puts "That doesn't seem to be a month I recognise, please try again or press enter to leave blank"
      cohort = gets.chomp
     else break
  end
end

  students << {name: name, cohort: cohort.to_sym}

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
  if names.count <= 1
  puts "Overall, we have #{names.count} great student"
else
  puts "Overall, we have #{names.count} great students"
end
end

students = input_students
print_header
print(students)
print_footer(students)
