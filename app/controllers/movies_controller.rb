class MoviesController < ApplicationController

  require 'net/http'
  require 'uri'
  require 'json'

  def index
    # APIを取ってくるサーバーを指定する
      search_uri = "https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV['API_KEY']}&language=ja-JA"
    # その形式を変換している,URIをリクエスト送れる形に変える
      enc_uri =URI.encode(search_uri)
      uri =URI.parse(enc_uri)
    # リクエストを送って取ってきている
      json = Net::HTTP.get(uri)
    # rubyで扱える形に成形している
      movies =JSON.parse(json)
      @base_contents = movies["results"]
  end

  def show
      search_uri = "https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV['API_KEY']}&language=ja-JA"
      enc_uri =URI.encode(search_uri)
      uri =URI.parse(enc_uri)
    # リクエストを送って取ってきている
      json = Net::HTTP.get(uri)
    # rubyで扱える形に成形している
      @movie_info =JSON.parse(json)
    # パラメータと同じレコードを取得
      @reviews = Review.where(movie_id: params[:id] )
      @movie = Movie.find_by(tmdb_id: params[:id])
      movies =  Movie.where(tmdb_id: params[:id])
    # 映画idは登録済みか？
   if movies.blank?
    # 映画のidを登録
      Movie.create(tmdb_id: params[:id])
   end

  end


  def search
      search_uri = "https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV['API_KEY']}&language=ja-JA"
      enc_uri =URI.encode(search_uri)
      uri =URI.parse(enc_uri)
    # リクエストを送って取ってきている
      json = Net::HTTP.get(uri)
    # rubyで扱える形に成形している
      @movie_info =JSON.parse(json)
  end


end