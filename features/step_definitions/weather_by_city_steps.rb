  Dado("que quero buscar o clima da cidade") do
    @weatherPage = WeaterByCityPage.new
  end

  Quando("eu faco um GET passando a cidade {string}, estado {string} e pais {string}") do |string, string2, string3|
    @response = @weatherPage.getCidadePNome(string, string2, string3)
  end

  Entao("o sistema retorna o codigo {int}") do |int|
    expect(@response.code).to eq(int)
    puts @response
  end

  Entao("dentro da requisicao, o valor da chave Name deve vir {string}") do |string|
    expect(@response.parsed_response['name']).to eq string
  end

  Entao("retorna uma {string}") do |string|
    expect(@response.parsed_response['message']).to eq string
  end

  Quando("eu faco um GET passando o id {string}") do |string|
    @response = @weatherPage.getCidadePeloId(string)
  end

  Quando("eu faco um GET passando a latitude {string} e a longitude {string}") do |string, string2|
    @response = @weatherPage.getCidadePelasCoordenadas(string, string2)
  end

  Quando("eu faco um GET passando o cod postal {string} e pais {string}") do |string, string2|
    @response = @weatherPage.getCidadePeloCodPostal(string, string2)
  end