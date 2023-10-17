class Api::NewsController < ApplicationController
  def index
    news_service = NewsApiService.new
    @categories = news_service.fetch_categories
    @articles = news_service.fetch_articles(params.permit!.slice(:category))
  end
end
