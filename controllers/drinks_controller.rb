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
    "DRINKS PAGE"
  end

  # NEW
  get '/drinks/new'  do

  end

  # SHOW
  get '/drinks/:id' do
    # get the ID and turn it in to an integer
    id = params[:id].to_i

  end

  # CREATE
  post '/drinks' do

  end

  # EDIT
  get '/drinks/:id/edit'  do
    id = params[:id].to_i

  end

  # UPDATE
  put '/drinks/:id'  do
    id = params[:id].to_i

  end

  # DESTROY
  delete '/drinks/:id'  do

  end
end
