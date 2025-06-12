class Animal < ActiveRecord::Base
    self.table_name = 'animals_cad'
 
    def self.fetch_animals_available
        all.to_a.to_json
    end
end

# variável constante 
CONSULTATION_VALUE = 50.0

def handle_count_animals(animals)
  count = animals.count
  { message: "Existem #{count} animais na base de dados." }.to_json
end

def calculate_consult(animals, name)
  animals.each do |animal|
    next if animal.age.nil? || animal.weight.nil?
        if animal.name == name
            if animal.age >= 4 && animal.age <= 9 && animal.weight > 4.0
                value = CONSULTATION_VALUE * 4
            # condicionais E e OU
            elsif (animal.age >= 10 && animal.weight > 4.0) || (animal.weight >= 12.0)
                value = CONSULTATION_VALUE * 8
            else
                value = CONSULTATION_VALUE
            end
            return { message: "O valor da consulta para #{name} é R$#{value}" }.to_json
        end
    end
    # Caso não encontre o animal
    { message: "Animal #{name} não encontrado." }.to_json
end
