require 'sinatra'
require 'active_record'
require 'json'
require_relative 'animal.rb'

set :bind, '0.0.0.0'
set :port, 4567

ActiveRecord::Base.establish_connection({
  adapter:  'mysql2',
  host:     'animals-vet-mysql',
  username: 'root',
  password: 'root',
  database: 'vet_animals'
})

# variável global (necessário o cifrão)
$contador = 0

# bloco sinatra
get '/' do
  'Server Connected'
end

get '/animals' do
  # contadores só podem ser usados assim ou '$contador = contador + 1'
  $contador += 1
  content_type :json
  Animal.fetch_animals_available
end

get '/active-animals' do
  $contador += 1
  content_type :json
  # variável local
  animals = Animal.all
  handle_count_animals(animals)
end

post '/create' do
  $contador += 1
  request.body.rewind
  data = JSON.parse(request.body.read)

  animal = Animal.create(name: data["name"], age: data["age"], species: data["species"], weight: data["weight"], owner: data["owner"])

  status 201
  animal.to_json
end

delete '/animals/:id' do
  $contador += 1
  animal = Animal.find_by(id: params[:id])
  if animal
    animal.destroy
    status 204
  else
    status 404
    { error: "Animal not found" }.to_a
  end
end

get '/consult' do
  name = params["name"]  # vem de ?name=juju na URL
  animals = Animal.all
  calculate_consult(animals, name)
end

get '/actions' do
  # apenas uma string que será exibida como resposta HTTP enviada para o client que fez a requisição
  "Quantidades de consultas no banco de dados #{$contador}."

  # imprime no console/terminal onde o servidor está rodando (útil para debug).
  puts "Quantidades de consultas no banco de dados #{$contador}."
end

# palavras reservadas no código: class, self, def, end
