class Animal   
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end

    def RegisterSuccess(name, age)
        puts "Ola, #{name} cadastrado com sucesso!"
    end
end
    