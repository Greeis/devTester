#language: pt

Funcionalidade: Remover contatos
    Sendo um usuário cadastrado que possui contatos indesejados
    Posso apagar um contato
    Para manter minha agenda organizada e atualizada

    @temp
    Cenario: Excluir um contato

        Dado que eu tenho um contato intesejado
        Quando eu apago este contato
        Então eu não devo ver este contato na minha agenda