# classes (Upper camel case, ou seja, sem espaço e todas as outras palavras depois da primeira tem letra maiúscula)
class Animal < ActiveRecord::Base
    # variável de classe para contar instâncias criadas
    @@count = 0

    # equivalente ao this em java, representa o objeto atual (a instância que está executando o método).
    self.table_name = 'animals_cad'
 
    def self.fetch_animals_available
        all.to_a.to_json
    end

    # método de instância — pode acessar variáveis de instância
    def message_for_animal
        #variável de instância, nao precisaria atribuir manualmente, poderia usar o self.name diretamente
        "Olá, meu nome é #{@name}, tenho #{@age} anos e sou um #{@species}."
    end

    def self.count_animals_created
        @@count
  end
end

# variável constante 
CONSULTATION_VALUE = 50.0

# snake_case (palavras separadas por underline)
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

# Variáveis de classe começam com @@, ex: @@total ?