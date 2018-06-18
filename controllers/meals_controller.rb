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
    "MEALS PAGE"
  end

  # NEW
  get '/meals/new'  do

  end

  # SHOW
  get '/meals/:id' do
    # get the ID and turn it in to an integer
    id = params[:id].to_i

  end

  # CREATE
  post '/meals' do

  end

  # EDIT
  get '/meals/:id/edit'  do
    id = params[:id].to_i

  end

  # UPDATE
  put '/meals/:id'  do
    id = params[:id].to_i

  end

  # DESTROY
  delete '/meals/:id'  do

  end
end
