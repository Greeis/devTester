Before do
    @contato_page = ContatoPage.new
end


After ('@inserirContato') do
    res = DAO.new.busca_celular(@novo_contato[:celular])

    # eu espero que o nome registrado no banco seja igual com o da minha massa de testes
  
    expect(res[:nome]).to eql @novo_contato[:nome]
    expect(res[:email]).to eql @novo_contato[:email]
    expect(res[:celular]).to eql @novo_contato[:celular]
    expect(res[:tipo]).to eql @novo_contato[:tipo]
end