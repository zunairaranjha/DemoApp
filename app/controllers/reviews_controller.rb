class ReviewsController < ApplicationController
    before_action :find_post
    before_action :find_review, only: [:edit, :update, :destroy]


    def show
        # postsavg= Post.all.average(:rate).to_i
        # @post=Post.all.where(:rate => postsavg)
        # render json: @post, status:200
      end
    def new
        @review = Review.new
    end
    def create
        @review = Review.new(review_params)
        @review.post_id = @post.id
        @review.user_id = current_user.id
        if @review.save
            render json: post_path(@post), staus:200
        else
            render json: 'new'
        end
    end
    def edit
     end
    def update
         if @review.update(review_params)
            render json: post_path(@post), staus:200
         else
            render json: 'edit'
         end
    end
    def show

    end
def destroy
    @review.destroy
    render json: post_path(@post), staus:200
end
private
   def review_params
    params.require(:review).permit(:rating, :comment)
    end
   def find_post
    @post = Post.find(params[:post_id])
    end  
    def find_review
        @review = Review.find(params[:id])

    end

end