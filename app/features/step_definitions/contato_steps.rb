  Dado("que possuo o seguinte contato:") do |table| 
    @novo_contato = table.rows_hash
  end
  
  Quando("faço o cadastro deste novo contato") do
    visit 'http://localhost:3000'
    # find('#nome').set @nome
  
    # fill_in 'nome', with: @nome
    # fill_in 'email', with: @dados_contato[:email]
    # fill_in 'celular', with: @dados_contato[:celular]

    find('input[placeholder="Nome completo"').set @novo_contato[:nome]
    find('#email').set @novo_contato[:email]
    find('input[data-test=celular]').set @novo_contato[:celular]

    if @novo_contato[:tipo] != ''
      tipo_contato = find('#tipo')
      tipo_contato.find('option', text: @novo_contato[:tipo]).select_option
    end
    click_on 'Cadastrar'
  end

  Então("devo ver a seguinte mensagem de alerta {string}") do |mensagem|
    alert = find('.s-alert-box')
    expect(alert).to have_content mensagem
  end
  
  Então("este contato não deve ser inserido no banco de dados") do
    res = DAO.new.busca_celular(@novo_contato[:celular])
    # eu espero que o celular seja nulo, ou seja, ele não encontrou o registro
    # fazendo um teste funcional com o teste de integração com db
    expect(res).to be_nil 
  end

  Dado("já existe um contato cadastrado com este celular") do
    steps %(
      Quando faço o cadastro deste novo contato
    ) #reaproveita step
  end
  
  Então("devo ver a mensagem de alerta {string}") do |mensagem|
    alert = find('.s-alert-box')
    expect(alert).to have_content mensagem
  end
  
  
  
#   Então("este contato deve ser inserido no banco de dados") do
#     # require 'mongo'
#     # Mongo::Logger.logger = Logger.new('log/mongo.log')
#     # client = Mongo::Client.new([ '127.0.0.1:3001' ], :database => 'meteor')
    
#     # contatos = client[:contatos]
    
#     # res = contatos.find('celular' => @novo_contato[:celular]).first

#     res = DAO.new.busca_celular(@novo_contato[:celular])

#     # eu espero que o nome registrado no banco seja igual com o da minha massa de testes
  
#     expect(res[:nome]).to eql @novo_contato[:nome]
#     expect(res[:email]).to eql @novo_contato[:email]
#     expect(res[:celular]).to eql @novo_contato[:celular]
#     expect(res[:tipo]).to eql @novo_contato[:tipo]
  
#  end


  # Então("devo ver a seguinte mensagem de sucesso {string}") do |mensagem|
  #   # pega o texto da msg de alerta
  #   alert = page.driver.browser.switch_to.alert.text
  #   # expect(alert).to have_content mensagem
  #   expect(alert).to eql mensagem
  #   # aceitando a msg
  #   page.driver.browser.switch_to.alert.accept
  # end

  # Então("devo ver a seguinte {string} de alerta") do |mensagem|
  #   alert = page.driver.browser.switch_to.alert.text
  #   expect(alert).to eql mensagem
  #   puts 5
  # end
  

