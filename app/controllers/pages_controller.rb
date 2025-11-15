class PagesController < ApplicationController
  def home
    @articles = Article.order(created_at: :desc).limit(3)
    @featured_projects = Project.order(released_on: :desc).limit(3)
  end

  def about
    @profile = Profile.first # or Profile.first_or_create!
  end
end
