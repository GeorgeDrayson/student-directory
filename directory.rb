def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #We create the students array
  students = []
  #Then we get the name of the first person
  name = gets.chomp
  puts "Which cohort are they in?"
  cohort = gets.chomp.to_s
  cohort = "november" if cohort.empty?
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    puts "Which cohort are they in?"
    cohort = gets.chomp.to_s
    cohort = :november if cohort.empty?
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
