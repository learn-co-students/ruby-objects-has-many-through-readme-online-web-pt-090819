require 'pry'
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
  
  def new_meal(waiter, total, tip)
    meal = Meal.new(waiter, self, total, tip)
  end 
 
  def meals
    Meal.all.select{|meal| meal.customer == self}
  end 
  
  def waiters
    b = []
    a = Meal.all.select{|meal| meal.customer == self}
    a.each {|w| b << w.waiter}
    b
    #binding.pry
  end 
end