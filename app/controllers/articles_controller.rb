class ArticlesController < ApplicationController

	before_action :authenticate_user!

	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = User.find(current_user.id)
		@article.save
		redirect_to user_articles_path notice: "Article saved!"
	end

	private

	def article_params
		params.require(:article).permit(:title, :author, :date_published, :tags, :url, :user)
	end

end