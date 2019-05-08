# require_relative '../config/environment'

def welcome
  puts "WW      WW EEEEEEE LL       CCCCC   OOOOO  MM    MM EEEEEEE"
  puts "WW      WW EE      LL      CC    C OO   OO MMM  MMM EE     "
  puts "WW   W  WW EEEEE   LL      CC      OO   OO MM MM MM EEEEE  "
  puts " WW WWW WW EE      LL      CC    C OO   OO MM    MM EE     "
  puts "  WW   WW  EEEEEEE LLLLLLL  CCCCC   OOOO0  MM    MM EEEEEEE"
  puts " "
end

def option
  puts "1. Search for drink based on liquor type."
  puts "2. Search for drink based on name."
  puts "3. Search for non-alcoholic drink."
  puts "7. Get a random drink"
  puts ""
  puts "8. Exit"
  puts "====================================="
  puts "Please enter a number to choose an option:"

  options = gets.chomp.to_i
  # def
  
  case options
  when 1
    puts "Input Liquor type:"


  when 2
    puts "Input drink name:"


  when 3
    puts "You selected non-alcoholic"


  when 7
    puts "You random drink is..."


  when 8
    puts "Bye Bye"
  else
    puts "\n\n!!! Invalid input. Try again!!! \n\n"
    option
  end
end

#running
welcome
option

#   _
#  {_}
#  |(|
#  |=|
# /   \
# |.--|
# ||  |
# ||  |    .    ' .
# |'--|  '     \~~~/
# '-=-' \~~~/   \_/
#       \_/     Y
#        Y     _|_
# jgs    _|_
