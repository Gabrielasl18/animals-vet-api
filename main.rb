require 'sinatra'
require 'active_record'

set :bind, '0.0.0.0'
set :port, 4567

ActiveRecord::Base.establish_connection({
  adapter:  'mysql2',          
  host:     'animals-vet-mysql',
  username: 'root',            
  password: 'root',            
  database: 'vet_animals'      
})

class Animal < ActiveRecord::Base
  self.table_name = 'animal'
end

get '/' do
  'Server Connected'
end

get '/animals' do
  animais = Animal.all 
  return animais.to_json 
end

post '/create' do
  request.body.rewind
  data = JSON.parse(request.body.read)

  animal = Animal.create(name: data["name"], age: data["age"])
  
  status 201
  animal.to_json
end

delete '/animals/:id' do
  animal = Animal.find_by(id: params[:id])
  if animal
    animal.destroy
    status 204
  else
    status 404
    { error: "Animal not found" }.to_json
  end
end