class PostsController < ApplicationController
	before_action :set_post, only: %i[show edit update destroy]
	before_action :all_posts, only: %i[index]

	def index
		@post = post.new
	end

	def new
		@post = post.new
	end

	def create
		@post = current_user.post.new(post_params)
		if @post.save
			redirect_to root_url
			flash[:success] = 'Post create'
		else
			render :new
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

	private

	def post_params
		params.require(:post).permit(:content)
	end

	def set_post
		@post = post.find(params[:id])
	end

	def all_posts
		@posts = post.all
	end

	def post
		Post
	end

end