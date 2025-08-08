# app/controllers/api/v1/articles_controller.rb
module Api
  module V1
    class ArticlesController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :authenticate_api_key!

      def create
        article = Article.new(article_params)
        if article.save
          render json: { id: article.id, message: "created" }, status: :created
        else
          render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find_by(id: params[:id])
        return render json: { error: "not_found" }, status: :not_found unless article

        article.destroy
        head :no_content
      end

      private

      def article_params
        params.require(:article).permit(:title, :slug, :content, :published_at)
      end

      def authenticate_api_key!
        key = request.headers["X-Api-Key"].to_s
        expected = Rails.application.credentials.dig(:api, :key).to_s
        ok = key.present? && ActiveSupport::SecurityUtils.secure_compare(key, expected)
        render(json: { error: "unauthorized" }, status: :unauthorized) unless ok
      end
    end
  end
end
