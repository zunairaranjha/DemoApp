class PostsController < ApplicationController
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
                flash[:success] = "Welcome to the Sample App!"
                render json: root_path,staus:200           
            else
              render json: 'New', status: 422
        end 
end
def edit
 @post = Post.find(params[:id])
end
    def update
        if @post.update(post_params)
            render json: post_path(@post), staus:200
        else
            render json: 'edit', status: 422
        end
    end
def destroy
    @post = Post.find(params[:id])
    @post.destroy
    puts "======>Post destryoed successfully"
    render json: post_path(@post), staus: :see_other
end
private
def post_params
    params.require(:post).permit(:title, :content)
end
 def find_post
    @post = Post.find(params[:id])
 end

 def client_ip
    if Rails.env.production?  
      @ip = request.remote_ip
    else
      @ip = "{YOUR_IP}" 
    end
  end
end
