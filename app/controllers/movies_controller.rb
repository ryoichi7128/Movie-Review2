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
    # @movie_info = respose_data["results"]
  end


end