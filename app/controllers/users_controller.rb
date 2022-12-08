class UsersController < ApplicationController
  
  before_action :authenticate_user!
  #before_action :correct_user, only: [:edit, :update]<=本来はいらない
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @book = Book.new
    @users = User.all
  end

  def edit
    if current_user == User.find(params[:id])
      @user = current_user
    else
     redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render("users/edit")
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  #def correct_user<=本来はいらない
    #@user = User.find(params[:id])<=本来はいらない
    #redirect_to(user_url) unless @user == current_user<=本来はいらない
  #end
  
end
