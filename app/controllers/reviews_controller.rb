class ReviewsController < ApplicationController

before_action :authenticate_user!

  def new
      search_uri = "https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV['API_KEY']}&language=ja-JA"
      enc_uri =URI.encode(search_uri)
      uri =URI.parse(enc_uri)
      json = Net::HTTP.get(uri)
      @movie_info =JSON.parse(json)

      @review = Review.new
      @movie_id = params[:id]
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
   
    if @review.save
       flash[:notice] = "successfully"
       redirect_to review_path(@review.id)
    else
       redirect_to request.referer
       flash[:notice] = "！入力してください！"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
        @review = Review.find(params[:id])
    if  @review.update(review_params)
        flash[:notice] = "successfully"
        redirect_to review_path(@review.id)
    else
        render action: :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to "/"
  end

  private
    def review_params
      params.require(:review).permit(:body, :movie_id, :rate)
    end

end
