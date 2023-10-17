class NewsApiService
  attr_reader :url, :api_key

  def initialize
    @api_key = '42a6e108bb4548cc8d3179d86d554a49'
    @url = 'https://newsapi.org/v2/top-headlines'
  end

  def fetch_articles(params = {})
    api_params = {
      'apiKey': api_key,
      country: 'ph'
    }

    response = RestClient.get url, params: api_params.merge(params)
    JSON.parse(response)['articles']
  end

  def fetch_categories
    %w[business entertainment general health science sports technology]
  end
end
