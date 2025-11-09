# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    @article = Article.find_by(slug: params[:id]) || Article.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound unless @article

    # Redirect numeric/legacy paths to the slugged URL
    if request.path != article_path(@article)
      return redirect_to article_path(@article), status: :moved_permanently
    end
  end
end
