class Api::NewsController < ApplicationController
  def index
    @categories = %w[business entertainment general health science sports technology]
    api_params = {
      'apiKey': '42a6e108bb4548cc8d3179d86d554a49',
      country: 'ph'
    }

    url = 'https://newsapi.org/v2/top-headlines'
    @response = RestClient.get url, params: api_params
    @articles = JSON.parse(@response)['articles']
  end
end
