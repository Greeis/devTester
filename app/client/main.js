import { Template } from 'meteor/templating' // importando o template
import './main.html'
import { Meteor } from 'meteor/meteor';

console.log('Ola Meteor. Estou do lado do cliente :)  FRONT-END')

Meteor.startup(function () {

    sAlert.config({
        effect: '',
        position: 'bottom',
        timeout: 5000
    })
})


Template.novoContato.events({ // criando eventos
    'click #salvarContato'(event,instance){ // quando clicar no botão salvar contato
        event.preventDefault(); //cancela a execução assincrona.

        // pegando os dados do novo contato...criando obj json      

        var form = {
            nome: $('input[name=nome]').val(),
            email: $('input[name=email]').val(),
            celular: $('input[name=celular]').val(),
            tipo: $('select[name=tipo]').val()
        }
        console.log(form)

        if (form.nome == ""){
            sAlert.warning('Ops. O nome deve ser preenchido.')
            return false;
        }else if(form.email == ""){
            sAlert.warning('Ops. O email deve ser preenchido.')
            return false;
        }else if(form.celular == ""){
            sAlert.warning('Ops. O celular deve ser preenchido.')
            return false;
        }else if(form.tipo == null){
            sAlert.warning('Ops. Por favor selecione um tipo de contato.')
            return false;
        }

        // Verificando

        Meteor.call('inserirContato', form, function(err, res){
            if(err){
                sAlert.error(err.reason)
            }else{
                sAlert.success('Contato cadastrado com sucesso.')
            }
        })
    },
    'click #deleteContato'(event, instance){
        //Deletar contato
    }

});