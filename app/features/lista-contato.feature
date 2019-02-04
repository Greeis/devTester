#language: pt

Funcionalidade: Lista contatos
    Sendo um usuário que possui contatos cadastrados
    Posso acessar a minha agenda
    Para que eu possa ver minha lista de contatos

    @sprint4
    Cenario: Listar contatos

        Dado que tenho os seguintes contatos cadastrados:
            |nome        |email          |celular   |tipo     |
            |Sidimara |sidi@gmail.com|2199991001|Whats    |
            |Edson  |edson@gmail.com|2199991002|Telegram |
        Quando acesso a minha agenda
        Então devo ver estes registros na lista de contatos
    
    @sprint5
    Cenario: Nenhum contato cadastrado
        Dado que não possuo contatos cadastrados
        Quando acesso a minha agenda
        Então devo ver a mensagem "Você ainda não possui contatos cadastrados."