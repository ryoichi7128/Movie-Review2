class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = params[:id]
    if @review.save
       flash[:notice] = "successfully"
       redirect_to movies_index_path
    else
       render action: :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:body)
    end

end
