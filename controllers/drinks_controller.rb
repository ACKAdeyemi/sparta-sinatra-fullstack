class DrinksController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # INDEX
  get '/drinks' do
    @title = "The Drinks We Offer"
    @drinks = Drink.all

    erb :'drinks/index'
  end

  # NEW
  get '/drinks/new' do
    @title = "Enter New Drink"
    @drink = Drink.new

    erb :'drinks/new'
  end

  # SHOW
  get '/drinks/:id' do
    # get the ID and turn it in to an integer
    id = params[:id].to_i

    @drink = Drink.find id

    erb :'drinks/show'
  end

  # CREATE
  post '/drinks/' do
    drink = Drink.new

    drink.title = params[:title]
    drink.description = params[:description]

    drink.save

    redirect '/drinks'
  end

  # EDIT
  get '/drinks/:id/edit'  do
    id = params[:id].to_i

    @drink = Drink.find id

    erb :'drinks/edit'
  end

  # UPDATE
  put '/drinks/:id'  do
    id = params[:id].to_i

    drink = Drink.find id

    drink.title = params[:title]
    drink.description = params[:description]

    drink.save

    redirect '/drinks'
  end

  # DESTROY
  delete '/drinks/:id'  do
    id = params[:id].to_i

    Drink.destroy id

    redirect '/drinks'
  end
end
