class Recipe
  include MongoMapper::Document

  connection Mongo::Connection.new('localhost')
  set_database_name 'recipes'
end
