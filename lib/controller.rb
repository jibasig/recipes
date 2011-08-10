require 'sinatra';
require 'haml';

get '/' do
	haml :index
end

get '/list' do
	'returns all recipes'
end

get '/edit/:id' do
	"edit recipe details for #{params[:id]}"
end


