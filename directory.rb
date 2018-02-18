@students = []

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #We create the students array
  #Then we get the name of the first person
  name = STDIN.gets.chomp
  puts "Which cohort are they in?"
  cohort = STDIN.gets.chomp.to_s
  cohort = :november if cohort.empty?
  while !name.empty? do
    add_students(name, cohort)
    puts @students.count == 1 ? "Now we have 1 student" : "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
    puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp.to_s
    cohort = :november if cohort.empty?
  end
  puts "Succesffully inputted students"
end

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "What file would you like to save to (default is students.csv)"
      save_file = STDIN.gets.chomp
      save_students(save_file)
    when "4"
      puts "What file would you like to load from (default is students.csv)"
      load_file = STDIN.gets.chomp
      load_students(load_file)
    when "9"
      exit
    else
      puts "I don't know what you meant, please try again"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students(filename = "students.csv")
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Succesfully saved students to #{filename}"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
  puts "Successfully loaded students from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
    "students.csv was loaded by default"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

interactive_menu
