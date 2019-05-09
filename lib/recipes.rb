class Recipes < ActiveRecord::Base
      # user, tweet
    attr_accessor :user_name, :drinks

    @@all = []

    def initialize(user_name, drinks)
      @user_name = user_name
      @drinks = drinks
      @@all << self
    end

    def self.all
      @@all
    end
  end
