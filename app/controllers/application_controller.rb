class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  include SessionsHelper  
  before_action :login_required
  before_action :check_current_user?

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def check_current_user?
    unless @user == current_user
        flash[:notice] = "権限がありません"
        redirect_to blogs_path
    end
  end
end
