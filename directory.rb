def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #We create the students array
  students = []
  #Then we get the name of the first person
  name = gets.chomp
  puts "Which cohort are they in?"
  cohort = gets.chomp.to_s
  cohort = :november if cohort.empty?
  while !name.empty? do
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
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
def print_by_cohort(students)
  cohorts = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if cohorts[cohort] == nil
      cohorts[cohort] = [name]
    else
      cohorts[cohort].push(name)
    end
  end
  cohorts.each do |key,value|
    puts key.to_s.capitalize + " cohort"
    value.each { |n| puts n}
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_by_cohort(students)
print_footer(students)
