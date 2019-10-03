class Customer
  attr_accessor :name, :age 
  
  @@all = [] 
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0) #pass customer in as self, that way it refers to the specific instance. Through this, you can create a new meal as a customer and have all the attibutes associated to the Customer instance
    Meal.new(waiter, self, total, tip)
  end
  
  def meals #create a method that pulls all Meals equal to the specific instance of this Customer
    Meal.all.select { |meal| meal.customer == self }
  end
  
  def waiters #Uses the above Meals method to pull the Waiter instances from the return value of Meals
    meals.map { |meal| meal.waiter }
  end
end