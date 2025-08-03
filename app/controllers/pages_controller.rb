class PagesController < ApplicationController
  def home
    @articles = Article.published.limit(10)
    @projects = Project.order(released_on: :desc).limit(10)
  end

  def about
  end
end
