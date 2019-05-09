# require_relative '../config/environment'
require_relative '../lib/user.rb'
require_relative '../lib/ingredients.rb'
require_relative '../lib/recipes.rb'
require 'pry'

def run
  welcome
  option
end


## ========== WELCOME PAGE ========== ##
def welcome
  puts  <<~DOC
  _____           _    _        _ _      _
 / ____|         | |  | |      (_) |    {_}
| |     ___   ___| | _| |_ __ _ _| |    |(|
| |    / _ \\ / __| |/ / __/ _` | | |    |=|
| |___| (_) | (__|   <| || (_| | | |   /   \\
 \\_____\\___/ \\___|_|\\_\\\\__\\__,_|_|_|   |.--|  \\~~~/
| |    (_)   | | (_)                   ||  |   \\_/
| |     _ ___| |_ _ _ __   __ _        ||  |    Y
| |    | / __| __| | '_ \\ / _` |       |'--|   _|_
| |____| \\__ \\ |_| | | | | (_| |       '-=-'
|______|_|___/\\__|_|_| |_|\\__, |
                           __/ |
                          |___/

Welcome to the Cocktail Listing!
We are going to gets some drinks going to please select from the options available below...
.......
    DOC
end

## ========== USER MAIN MENU DISPLAY ========== ##
def option
  puts "\#1. Search for drink based on liquor type."
  puts "\#2. Get a random drink"
  puts ""
  puts "\#0. or type 'exit' to Exit"
  puts "====================================="
  puts "Please enter a number to choose an option:"

  options = gets.chomp.to_i
  # def

  case options
  when 1
    #will accept a liqupr type and display the available drinks to make
    #where the user can accept one to see the ingredients
    puts "Input Liquor type:"
    liquor_type = gets.chomp.to_s
    #search_by_name(liquor_type)

  when 2
    puts "You random drink is..."
    randomdrink = random_drink
    puts "Save drink?"
    User.like_drink(randomdrink)
  when 0 || 'exit'
    puts "Maybe next time, friend."

  else
    puts "\n\n!!! Sorry but that appears to be an invalid input. Please try again!!! \n\n"
    option
  end
end

#
# def save_drinks_to_user(user_name)
#   user_name = User.new(user_name)
#   puts "Thanks, #{user_name}"
#
# # binding.pry
#
# end

#displays info on a random drink
def random_drink
  # https://www.thecocktaildb.com/api/json/v1/1/random.php

  #option to save it to a list???
end



run
