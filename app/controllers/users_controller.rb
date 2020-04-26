class UsersController < ApplicationController


before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])

    @favorite = Favorite.where(user_id: @user.id)

    @book_mark = @favorite.select("movie_id")


    @movie = Movie.where(id: @book_mark )

for movie in @movie
    puts movie

    search_uri = "https://api.themoviedb.org/3/movie/#{movie.tmdb_id}?api_key=#{ENV['API_KEY']}&language=ja-JA"
    
    enc_uri =URI.encode(search_uri)
      uri =URI.parse(enc_uri)
    # リクエストを送って取ってきている
      json = Net::HTTP.get(uri)
    # rubyで扱える形に成形している
      @movie_info =JSON.parse(json)
  end

end

  def edit
  	@user = User.find(params[:id])
  end

  def update
 	   @user = User.find(params[:id])
 	if @user.update(user_params)
       flash[:notice] = "successfully"
       redirect_to user_path(current_user)
    else
       render action: :edit
    end
  end

  private
  	def user_params
    params.require(:user).permit(:name, :profile, :image, :age, :sex)
  	end



end
