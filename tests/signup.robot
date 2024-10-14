*** Settings ***
Documentation        Suíte de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
   
    ${dog_walker}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=felipe@sccp.com
    ...    cpf=00000014141
    ...    cep=06382270
    ...    street=Rua da Felicidade
    ...    district=Vila Silviânia
    ...    city_uf=Carapicuíba/SP
    ...    number=777
    ...    details=Casa 2
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required
   
    Go to signup page
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv
   
    ${dog_walker}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=felipe@sccp.com
    ...    cpf=1234001414A
    ...    cep=06382270
    ...    street=Rua da Felicidade
    ...    district=Vila Silviânia
    ...    city_uf=Carapicuíba/SP
    ...    number=777
    ...    details=Casa 2
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice
   
    ${dog_walker}    Create Dictionary
    ...    name=Dominic Toretto
    ...    email=toretto@gmail.com
    ...    cpf=00000014141
    ...    cep=06382270
    ...    street=Rua da Felicidade
    ...    district=Vila Silviânia
    ...    city_uf=Carapicuíba/SP
    ...    number=777
    ...    details=Casa 2
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]    aservice
   
    ${dog_walker}    Create Dictionary
    ...    name=Tony Stark
    ...    email=ironman@marvel.com
    ...    cpf=00000014141
    ...    cep=06382270
    ...    street=Rua da Felicidade
    ...    district=Vila Silviânia
    ...    city_uf=Carapicuíba/SP
    ...    number=777
    ...    details=Casa 2
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Adestrar
    Submit signup form
    Pop-up should be    Recebemos o seu cadastro e em breve retornaremos o contato.