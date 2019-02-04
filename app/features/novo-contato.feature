#language: pt

Funcionalidade: Novo Contato
    Sendo um usuario 
    Posso realizar um novo cadastro
    Para poder gerenciar minha rede de contatos

    @sprint1 @inserirContato
    Esquema do Cenario: Novo contato

        Dado que possuo o seguinte contato:
            |nome   |<nome>   |
            |email  |<email>  |
            |celular|<celular>|
            |tipo   |<tipo>   |
        Quando faço o cadastro deste novo contato
        Então devo ver a seguinte mensagem de alerta "Contato cadastrado com sucesso."

        Exemplos:
        |nome        |email          |celular   |tipo     |
        |Wade Wilson |wade@marvel.com|1199991001|Whats    |
        |Tony Stark  |tonny@stark.com|1199991002|Telegram |
        |Steve Rogers|rogers@aol.com |1199991003|SMS      |

    @sprint2
    Esquema do Cenário: Campos obrigatórios

        Dado que possuo o seguinte contato:
            | nome    | <nome>    |
            | email   | <email>   |
            | celular | <celular> |
            | tipo    | <tipo>    |
        Quando faço o cadastro deste novo contato
        Então devo ver a seguinte mensagem de alerta "<mensagem>"


        Exemplos:
            | nome         | email            | celular    | tipo     | mensagem                                     |
            |              | teste@gmail.com  | 1199991006 | Whats    | Ops. O nome deve ser preenchido.             |  
            | Teste        |                  | 1199991007 | SMS      | Ops. O email deve ser preenchido.            |  
            | Peter Parker | teste1@gmail.com |            | Telegram | Ops. O celular deve ser preenchido.          |  
            | Scott Lang   | teste3gmail.com  | 1199991008 |          | Ops. Por favor selecione um tipo de contato. |

    @sprint3
    Cenario: Celular não pode ser duplicado
        
        Dado que possuo o seguinte contato:
            | nome    | Graziele Almeida   |
            | email   | graziele@gmail.com |
            | celular | 11999990023        |
            | tipo    | Whats              |
        Mas já existe um contato cadastrado com este celular
        Quando faço o cadastro deste novo contato
        Então devo ver a seguinte mensagem de alerta "Celular já cadastrado para outro contato."