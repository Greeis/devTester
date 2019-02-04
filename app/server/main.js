import { Meteor } from "meteor/meteor";
import { onPageLoad } from "meteor/server-render";
import {Mongo} from 'meteor/mongo'

Meteor.startup(() => {
  // Code to run on server startup.
  console.log('Ola Meteor. Estou do lado do servidor :) BACK-END');
  const Contato = new Mongo.Collection('contatos');

  Meteor.methods({
    'inserirContato'(contato){
      var existe = Contato.findOne({ //verifica se já existe
        celular: contato.celular
      })

      if(existe){
        throw new Meteor.Error(409, "Celular já cadastrado para outro contato.")
      }else{
        Contato.insert(contato);  // cadastra o contato
      }
    }
  })
});

onPageLoad(sink => {
  // Code to run on every request.
  sink.renderIntoElementById(
    "server-render-target",
    `Server time: ${new Date}`
  );
});
