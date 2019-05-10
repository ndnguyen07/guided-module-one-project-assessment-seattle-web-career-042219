# require_relative '../config/environment'
require_relative '../lib/user.rb'
require_relative '../lib/ingredients.rb'
require_relative '../lib/api_communicator.rb'
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
We are going to gets some drinks going so please select from
the options available below to get started...
.......
    DOC
end

## ========== USER MAIN MENU DISPLAY ========== ##
def option
  puts "\#1. Search for drink based on a specific ingredient."
  puts "\#2. Take a chance on a random drink."
  puts "\#3. Get the recipe when you know the name of the drink already."
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
    puts "Input ingredient type:"
    liquor_type = gets.chomp
    drinks_list = search_by_name(liquor_type)
    drinks_list.each do|drink|
        drink.map do |key, value|
          if key == 'strDrink'
            print "#{value}, "
          end
        end
    end
    choose_again

  when 2
    # puts "Your random drink is the..."
    random_drink
    # puts "Save drink?"
    # User.like_drink(randomdrink)
    choose_again

  when 3
    puts "Know the name of the drink you want?"
    drink_name = gets.chomp.to_s
    getting_recipe(drink_name)

    choose_again

  when 0 || 'exit'
    puts "Maybe next time, friend. Bye-bye"

  else
    puts "\n\n!!! Sorry but that appears to be an invalid input. Please try again!!! \n\n"
    options
  end
end

def choose_again
  puts "Care to choose again? (y or n)"
  yesno = gets.chomp.to_s

  if yesno == 'y' || yesno.downcase == "yes"
    option
  else
    puts "Farewell"
  end

end

#displays info on a random drink
def random_drink
  # result = open("https://www.thecocktaildb.com/api/json/v1/1/random.php")

  def get_json(url)
    respond = RestClient.get(url)
    JSON.parse(respond)
  end

  def get_ingredient
    drink_listing = []
    drink_data = get_json("https://www.thecocktaildb.com/api/json/v1/1/random.php")['drinks'].each {|drink, ingr|ingr}.map {|name| name.values}

    drink_name  = drink_data[0][1]
    drink_type  = drink_data[0][21...35]
    drink_type = drink_type.reject do |data|
        data.empty?
    end.join(", ")
    "Your drink is a '#{drink_name}' and it is made from #{drink_type}"
    # "It is #{drink_type}"
  # drink_listing
  end
  puts get_ingredient
  #option to save it to a list???
end

run