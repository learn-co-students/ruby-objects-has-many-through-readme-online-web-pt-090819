class Waiter
  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
  def new_meal(customer, total, tip) #same as Customer instance, only swapping self to the Waiter's spot
    Meal.new(self, customer, total, tip)
  end
  
  def meals #Same as Customer instance
    Meal.all.select{|meal| meal.waiter == self}
  end
  
  def best_tipper
    max_tip = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    max_tip.customer
  end
end