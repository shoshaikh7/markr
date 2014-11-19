class ArticlesController < ApplicationController

	before_action :authenticate_user!

	def index
		@article = Article.new
		
		if params[:tag]
			@articles = Article.tagged_with(params[:tag])
		else
			@articles = current_user.articles
		end
		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.tag_list.add(params[:tag_list], parse: true)
		@article.user = current_user
		@article.save
		redirect_to user_articles_path(current_user), notice: "Article saved!"
	end

	private

	def article_params
		params.require(:article).permit(:title, :author, :date_published, :tag, :url, :user, :tag_list)
	end

end