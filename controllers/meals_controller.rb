class MealsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # INDEX
  get '/meals' do
    @title = "The Meals We Offer"
    @meals = Meal.all

    erb :'meals/index'
  end

  # NEW
  get '/meals/new' do
    @title = "Enter New Meal"
    @meal = Meal.new

    erb :'meals/new'
  end

  # SHOW
  get '/meals/:id' do
    # get the ID and turn it in to an integer
    id = params[:id].to_i

    @meal = Meal.find id

    erb :'meals/show'
  end

  # CREATE
  post '/meals/' do
    meal = Meal.new

    meal.title = params[:title]
    meal.description = params[:description]

    meal.save

    redirect '/meals'
  end

  # EDIT
  get '/meals/:id/edit'  do
    id = params[:id].to_i

    @meal = Meal.find id

    erb :'meals/edit'
  end

  # UPDATE
  put '/meals/:id'  do
    id = params[:id].to_i

    meal = Meal.find id

    meal.title = params[:title]
    meal.description = params[:description]

    meal.save

    redirect '/meals'
  end

  # DESTROY
  delete '/meals/:id'  do
    id = params[:id].to_i

    Meal.destroy id

    redirect '/meals'
  end
end
