require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

require_relative './models/Drink.rb'
require_relative './models/Meal.rb'

require_relative './controllers/static_controller.rb'
require_relative './controllers/drinks_controller.rb'
require_relative './controllers/meals_controller.rb'

# Middleware
use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  DrinksController,
  MealsController
])
