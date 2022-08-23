class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]

#   before_action :post_check

def index
    @posts = Post.all.order("created_at DESC")
    # render json: {@posts: :bar}
    # @top_post=Post.all.where(:rating => @average_review)
    # puts @posts.count
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
    # def record_post_time
    #     cookies[:last_post_at] = Time.now.to_i
    #   end
    #   def last_post_time
    #     Time.at((cookies[:last_post_at].to_i rescue 0))       
    #   end    
    #   MIN_POST_TIME = 60.seconds   
    # def post_check
    #     return true if  (Time.now - last_post_time) > MIN_POST_TIME
    #     flash[:notice] = "Too many posts makes you a busy cat!"
    #     @message = Post.find(post_params[:id])
    #     redirect_to(@message)
    #     return false
    # end
     
def create
    #   count= 0
# unless Rails.cache.read("user_ip_#{client_ip}_count").nil?
#        count = Rails.cache.read("user_ip_#{client_ip}_count").to_i + 1
#        puts " Count of HTTP requests =========> #{count}"
#     if count > 3
#         puts " More than 3 requests....!!! "
#         render json: root_path and return false
#         flash[:error] = "You're doing that too much. Slow down."
#         render json: root_path and return false
#     Rails.cache.write("user_ip_#{client_ip}_count", count, :expires_in => 1.minutes)
#     else
        @post = current_user.posts.build(post_params)
            if @post.save  
                # record_post_time         
                flash[:success] = "Welcome to the Sample App!"
                render json: root_path,staus:200           
            else
              render json: 'New', status: 422
            end 
    # end 
    # end
end
def edit
 @post = Post.find(params[:id])
end
    def update
        if @post.update(post_params)
            # record_post_time
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
