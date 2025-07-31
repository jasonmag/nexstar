# app/controllers/admin/articles_controller.rb
module Admin
  class ArticlesController < Admin::BaseController
    def index
      @articles = Article.order(published_at: :desc)
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        redirect_to admin_articles_path, notice: "Article updated."
      else
        render :edit
      end
    end

    # Add new/create/destroy as needed

    private

    def article_params
      params.require(:article).permit(:title, :content, :slug, :published_at)
    end
  end
end
