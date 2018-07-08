class PostsController < ApplicationController
	before_action :set_post, only: %i[edit update destroy upvote downvote]

	def index	
		@post = post.new
		@posts = post.all
	end

	def show
	end

	def create
		@post = current_user.post.new(post_params)
		if @post.save
			redirect_to root_url
			flash[:success] = 'Post create'
		else
			redirect_to root_url
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to root_url
			flash[:success] = 'Post update'
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_url
		flash[:success] = 'Post deleted successfully'
	end

	def upvote
		@post.upvote_from current_user
		redirect_to root_url
	end

	def downvote
		@post.downvote_from current_user
		redirect_to root_url
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end

	def set_post
		@post = post.find(params[:id])
	end

	def post
		Post
	end

end