class PagesController < ApplicationController
  def home
    @articles = Article.published.limit(10)
    @featured_projects = Project.order(released_on: :desc).limit(3)
  end

  def about
  end
end
