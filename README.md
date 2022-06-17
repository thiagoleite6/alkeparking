# Alkeparking
Projeto integrador Swift

## 💻 Projeto desenvolvido por
Guilherme e Thiago

# 🏋🏻 Exercícios

1) Por que vehicles é definido como um Set?
    R. Já que não podem existir dois veículos iguais, o Set utilizado por não aceitar itens duplicados.
###
2) Qual elemento do controle de fluxo poderia ser útil determinar a tarifa de cada
veículo na computed property: ciclo for, if ou switch?
    R. Utilizamos o Switch devido a necessidade de uma estrutura mais limpa.
###
3) Onde devem ser adicionadas as propriedades, em Parkable, Vehicle ou em ambos?
    R. Em ambos.
    ###
    3.1 O cartão de desconto é opcional, ou seja, um veículo pode não ter cartão e seu valor será nil. Qual tipo de dados do Swift permite ter esse comportamento?
    R. O tipo que permite esse comportamento é o Optional já que ele permite o uso de valores opcionais (Ex. String?)
###
4) O tempo de estacionamento dependerá de parkedTime e deverá ser computado cada vez que for consultado, tomando a data atual como referência.
Qual tipo de propriedade permite esse comportamento: lazy properties, computed properties ou static properties?
    R. Computed properties pois permite que a propriedade seja computada toda vez que for acessada.

###
5) Consulte a documentação da Apple para identificar qual função de Set pode ser útil para obter a quantidade de veículos no estacionamento.
   R. Utilizamos a função count.

###
7) Consulte a Documentação da Apple para identificar qual função de Set pode ser útil para obter um elemento em uma determinada condição.
    R. Utilizamos a função first(where:) já que retorna o primeiro elemento que satisfaz a determinada condição.
    ###
    7.1 Uma propriedade de um struct está sendo modificada. Qual consideração deve ser levada em conta na definição da função?
        R. Uso da palavra reservada mutating antes da declaração do nome da função.
###
10) Qual validação deve ser feita para determinar se o veículo tem desconto?
Lembre-se de que a única coisa que importa é se tem ou não um cartão de desconto, não o valor do cartão.
    R. Verificar se o cartão existe, isso é, se a string é diferente de nil

