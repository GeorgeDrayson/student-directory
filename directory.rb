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

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def interactive_menu
  students =[]
  loop do
    #print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #read the input and save it into a variable
    selection = gets.chomp
    #do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_by_cohort(students)
      print_footer(students)
    when "9"
      exit
    else
      "I don't know what you meant, please try again"
  end
end
