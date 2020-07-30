#language: pt
Funcionalidade: Weather By City
    Como um usuario
    Eu quero realizar as requisicoes na API
    Para poder receber as informacoes de clima de uma cidade

    @ConsultaClimaCidadePeloNome
    Esquema do Cenario: Consultar com sucesso clima pelo nome da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando a cidade <cidade>, estado <codestado> e pais <codpais> 
        Entao o sistema retorna o codigo <codrequisicao>
        E dentro da requisicao, o valor da chave Name deve vir <cidade>
        Exemplos:
        | cidade   | codestado    | codpais    | codrequisicao |
        | 'Lisbon' |     ''       |    ''      | 200           |
        | 'London' |     ''       |  'Uk'      | 200           |
        | 'Utah'   |     'Tx'     |  'Us'      | 200           |

    Esquema do Cenario: Consultar com erro o clima pelo nome da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando a cidade <cidade>, estado <codestado> e pais <codpais> 
        Entao o sistema retorna o codigo <codrequisicao>
        E retorna uma <mensagem>
        Exemplos:
        | cidade    | codestado | codpais  | codrequisicao | mensagem         |
        | 'Test'    |      'Us' |     'Us' |      404      | 'city not found' |
        | 'Sudeste' |     ''    |     'Br' |      404      | 'city not found' |
        | 'Test'    |   ''      |     ''   |      404      | 'city not found' |

    @ConsultaClimaCidadePeloId
    Esquema do Cenario: Consultar com sucesso o clima pelo ID da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando o id <idcidade>
        Entao o sistema retorna o codigo <codrequisicao>
        E dentro da requisicao, o valor da chave Name deve vir <cidade>
        Exemplos:
        | idcidade     | codrequisicao | cidade      |
        | '2172797'      |      200      | 'Cairns'    |
        | '4893392'      |      200      | 'Galesburg' |
        | '2267057'      |      200      | 'Lisbon'    |


    Esquema do Cenario: Consultar com erro o clima pelo ID da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando o id <idcidade>
        Entao o sistema retorna o codigo <codrequisicao>
        E retorna uma <mensagem>
        Exemplos:
        | idcidade | codrequisicao | mensagem |
        | '999990' |     404       | 'city not found' |
        | 'teste'  |     400       | 'teste is not a city ID'|

    @ConsultaClimaCidadePelasCoordenadas
    Esquema do Cenario: Consultar com sucesso o clima pelas coordenadas da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando a latitude <latitude> e a longitude <longitude>
        Entao o sistema retorna o codigo <codrequisicao>
        E dentro da requisicao, o valor da chave Name deve vir <cidade>
        Exemplos:
        | latitude | longitude  | codrequisicao | cidade      |
        | '39.25'  |  '-111.75' |        200    |    'Utah'   |
        | '39.89'  |  '-83.45'  |        200    |    'London' |

    Esquema do Cenario: Consultar com erro o clima pelas coordenadas da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando a latitude <latitude> e a longitude <longitude>
        Entao o sistema retorna o codigo <codrequisicao>
        E retorna uma <mensagem>
        Exemplos:
        | latitude  | longitude     | codrequisicao | mensagem              |
        | '-99.99'  | '999.999999'  | 400           | 'wrong latitude'      |
        | '99.9999' | '-99.99'      | 400           | 'wrong latitude'      |
        | 'teste'   | '-84.39'      | 400           | 'wrong latitude'      |

    @ConsultaClimaCidadePeloCodPostal    
    Esquema do Cenario: Consultar com sucesso o clima pelo Cod Postal da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando o cod postal <codpostal> e pais <codpais> 
        Entao o sistema retorna o codigo <codrequisicao>
        E dentro da requisicao, o valor da chave Name deve vir <cidade>
        Exemplos:
        | codpostal | codpais     |codrequisicao | cidade               |
        | '94040'     |     'us'    |     200      |   'Mountain View'    |

    Esquema do Cenario: Consultar com erro o clima pelo Cod Postal da cidade
        Dado que quero buscar o clima da cidade
        Quando eu faco um GET passando o cod postal <codpostal> e pais <codpais> 
        Entao o sistema retorna o codigo <codrequisicao>
        E retorna uma <mensagem>
        Exemplos:
        | codpostal | codpais |codrequisicao | mensagem         |
        | '123'       |  'us'   | 404          | 'city not found' |
        | '99999'     |  ''     | 404          | 'city not found'               |
        | 'teste'     |  'us'   | 404          | 'city not found'               |