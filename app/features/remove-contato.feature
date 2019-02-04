#language: pt

Funcionalidade: Remover contatos
    Sendo um usuário cadastrado que possui contatos indesejados
    Posso apagar um contato
    Para manter minha agenda organizada e atualizada

    
    Cenario: Excluir um contato

        Dado que possuo a seguinte lista de contatos para cadastro:
            | nome | email          | celular    | tipo  |
            | Yuki | yuki@gmail.com | 2299991001 | Whats |
        Quando solicito a exclusão deste contato
            E confirmo a exclusao
        Então eu não devo ver este contato na minha agenda
    
    @temp
    Cenario: Desistir
        Dado que possuo a seguinte lista de contatos para cadastro:
            | nome    | email             | celular    | tipo     |
            | Justica | justica@gmail.com | 2200991001 | Telegram |
        Quando solicito a exclusão deste contato
            E desisto da exclusão  
        Então este contato permanece na minha agenda