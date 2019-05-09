class User
    attr_reader :user_name, :drinks

    @@all = []

    def initialize(user_name)
      @argument = user_name
      @@all << self
    end

    def self.all
      @@all
    end

    def like_drink(drinks)
        Recipes.new(self, drinks)
    end



    def user_drinks
      Recipes.all.select do |drink|
        drink == user
      end
    end




# binding.pry
end
