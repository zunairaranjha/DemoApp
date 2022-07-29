class PostsController < ApplicationController
    require 'models/post'
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all.order("created_at DESC")
    end
    def new
        @post = current_user.posts.build
    end
    def show

        if @post.reviews.blank?
            @average_review = 0
        else
            @average_review = @post.reviews.average(:rating).round(2)
        end
    end

    def create
        
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end
def destroy
    @post.destroy

    redirect_to root_path, status: :see_other
end
private
def post_params
    params.require(:post).permit(:title, :content)
end
 def find_post
    @post = Post.find(params[:id])
 end
end
