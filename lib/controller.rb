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
end

get '/add' do
	coll = getConnection
	doc = {"name" => "MongoDB", "type" => "database", "count" => 2}
	coll.insert(doc)
end

def getConnection
	db = Mongo::Connection.new("localhost").db("recipes")
	coll = db["recipes"]
end

get '/sample' do
	coll = getConnection
	body = ""
	doc = coll.find().each { |row| body << "<br/>"<< row["name"] }
	body
end


