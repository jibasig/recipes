require 'sinatra';
require 'haml';
require 'mongo';


class Recipe
	attr_accessor :id, :name
end

get '/' do
	haml :index
end

get '/edit/:id' do
	"edit recipe details for #{params[:id]}"
	haml :detail
end

post '/add' do
	coll = getConnection
	doc = {"name" => params[:name], "ingredients" => params["ingredients"], "description" => params["description"], "type" => "database", "count" => 2}
	coll.insert(doc)
    	redirect to('/list')

end

get '/add' do
	haml :detail
end


def getConnection
	db = Mongo::Connection.new("localhost").db("recipes")
	coll = db["recipes"]
end

get '/list' do
	coll = getConnection
	@recipes = Array.new
	coll.find().each { |row| 
		recipe = Recipe.new
		recipe.id = row["id"]
		recipe.name = row["name"]
		@recipes << recipe 
		
	}
	haml :list 
end


