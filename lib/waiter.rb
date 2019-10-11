class Waiter
  attr_accessor :name, :experience

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select(){|meal|
      meal.waiter == self
    }
  end

  def best_tipper
    best_tip = meals.max(){|meal_1, meal_2|
      meal_1.tip <=> meal_2.tip
    }
    best_tip.customer
  end

  def self.all
    @@all
  end
end
