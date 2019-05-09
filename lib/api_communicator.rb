require 'rest-client'
require 'json'
require 'pry'
require 'net/http'
require 'open-uri'



def get_json(url)
  respond = RestClient.get(url)
  JSON.parse(respond)
end

def get_ingredient
  get_json("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")['drinks'].each {|drink, ingr|ingr}.map {|name| name.values}
end

def search_by_name(name)
  ingredient = open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{name}")
  drink_name = []
  JSON.load(ingredient)['drinks'].each {|list, drinks|
    if list == 'strDrink'
      drink_name << drinks
    end
  }
end

def getting_recipe(drink_name)
  result = open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink_name}")

  info = JSON.load(result)['drinks'].first.reject {|bev,comp|
  comp == "" || comp == " " || comp == nil}

  ingredients = []
  measurments = []
  instructions = info['strInstructions']

  ingredients + measurments

  info.each {|group,spec|
    if group.include?("Ingredient")
      ingredients << spec
    end

    if group.include?("Measure")
      measurments << spec
    end
  }
  return print "ingredients: #{ingredients.join(', ')}\nmeasurments: #{measurments.join(', ')}\ninstructions: #{instructions}"
end

# print getting_recipe("margarita")
