require 'mongo'

class DAO

    def busca_celular(celular)
        contatos.find('celular' => celular).first
    end

    def delete_celular(celular)
        contatos.delete_many('celular' => celular)
    end


    private
    def conecta
        Mongo::Logger.logger = Logger.new('log/mongo.log')
        client = Mongo::Client.new([ '127.0.0.1:3001' ], :database => 'meteor')
    end

    def contatos
        conecta[:contatos]
    end

end