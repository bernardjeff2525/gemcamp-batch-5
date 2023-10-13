class Api::NewsController < ApplicationController
  def index
    params = { 'apiKey': '42a6e108bb4548cc8d3179d86d554a49', country: 'ph' }
    url = 'https://newsapi.org/v2/top-headlines'

    @response = RestClient.get url, params: params
    @articles = JSON.parse(@response)['articles']
  end
end