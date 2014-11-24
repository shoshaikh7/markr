class UsersController < ApplicationController

	before_action :authenticate_user!

	def sort
		articles = params[:article]
		articles.each.with_index do |article, index|
			Article.find(article).update(position: (index + 1))
		end
		respond_to do |format|
			format.js {head :no_content}
		end
	end

	def show
		
	end
end