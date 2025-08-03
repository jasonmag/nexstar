class ArticlesController < ApplicationController
  def index
    @articles = Article.published.order(published_at: :desc)
  end

  def show
  end
end
