require 'sinatra';
require 'haml';
require 'mongo';

get '/' do
	haml :index
end

get '/list' do
	'returns all recipes'
end

get '/edit/:id' do
	"edit recipe details for #{params[:id]}"
	haml :add
end

post '/add' do
	coll = getConnection
	doc = {"name" => params[:name], "ingredients" => params["ingredients"], "description" => params["description"], "type" => "database", "count" => 2}
	coll.insert(doc)
    	redirect to('/sample')
end

get '/add' do
	haml :add
end


def getConnection
	db = Mongo::Connection.new("localhost").db("recipes")
	coll = db["recipes"]
end

get '/sample' do
	coll = getConnection
	@recipes = Array.new
	coll.find().each { |row| @recipes << row["name"] 
		
	}
	haml :sample 
end


