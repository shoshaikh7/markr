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

	def show
		
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.tag_list.add(params[:tag_list], parse: true)
		@article.user = current_user
		@article.set_image
		@article.save
		redirect_to user_articles_path(current_user), notice: "Article saved!"
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
	  		respond_to do |format|
	  			format.html { redirect_to [current_user, article], notice: 'Site successfully updated.' }
	      		format.json { respond_with_bip(@article) }
	  		end
	  	else
	  		respond_to do |format|
	  			format.html { redirect_to [current_user, article], notice: 'Something went wrong.' }
	      		format.json { respond_with_bip(@article) }
	  		end
	  	end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		respond_to do |format|
			format.html { redirect_to [current_user, article], notice: "Bookmark was deleted." }
			format.js { head :no_content }
		end
	end


	private

	def article_params
		params.require(:article).permit(:title, :author, :date_published, :tag, :url, :user, :tag_list)
	end

end