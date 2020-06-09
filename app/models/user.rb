class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :reviews, dependent: :destroy
  has_many :favorites
  #ユーザーがいいねしている映画を取得できるようにthroughオプションを利用した関連付け
  has_many :favorite_movies, through: :favorites
  has_many :comments
end
