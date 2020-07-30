class WeaterByCityPage
  include HTTParty
  base_uri 'api.openweathermap.org/data/2.5/weather'
  $uri_token = '&appid=e1ff753b041157c79061e2cce7807797'

  def getCidadePNome(cidade, cod_estado, cod_pais)
    url = ''
    if cidade != ''
      url += cidade
    end
    if cod_estado != ''
      url += ',' + cod_estado
    end
    if cod_pais != ''
      url += ',' + cod_pais
    end
    self.class.get("?q=#{url}"+$uri_token)
  end

  def getCidadePeloId(id)
    self.class.get("?id=#{id}"+$uri_token)
  end

  def getCidadePelasCoordenadas(lat, lon)
    self.class.get("?lat=#{lat}&lon=#{lon}"+$uri_token)
  end

  def getCidadePeloCodPostal(cod_postal, cod_pais)
    self.class.get("?zip=#{cod_postal},#{cod_pais}"+$uri_token)
  end
end