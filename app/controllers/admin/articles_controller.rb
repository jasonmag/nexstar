# app/controllers/admin/articles_controller.rb
module Admin
  class ArticlesController < Admin::BaseController
    before_action :set_article, only: [ :edit, :update, :destroy ]

    def index
      @articles = Article.order(published_at: :desc)
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path, notice: "Article created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path, notice: "Article updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path, notice: "Article deleted."
    end

    private

    def set_article
      # If the param looks numeric, fall back to ID (for old records/links)
      if params[:id].to_s.match?(/\A\d+\z/)
        @article = Article.find(params[:id])
      else
        # Otherwise treat it as a slug
        @article = Article.find_by!(slug: params[:id])
      end
    end

    def article_params
      params.require(:article).permit(:title, :content, :slug, :published_at)
    end
  end
end
