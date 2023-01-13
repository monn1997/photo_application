class FavoritesController < ApplicationController
  skip_before_action :check_current_user?, only: [:index, :create, :destroy]
  def index
    @favorites = current_user.favorites    
  end  
   
  def create
    @user = current_user
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    @user = current_user
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end     
end
