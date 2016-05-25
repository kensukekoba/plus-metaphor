class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destory]
  before_action :user_check, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for your registration!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      flash[:success] = "Update your profile !"
      redirect_to @user
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "Delete your user account !"
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :favo_phrase)
  end
  
  def set_user
      @user = User.find(params[:id])
  end  
  
  def user_check
    @user = User.find(params[:id])
    if @user != current_user 
      redirect_to root_path
      flash[:danger] = "指定したページにはアクセスできません"
    end
  end

end
