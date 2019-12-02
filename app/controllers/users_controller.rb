class UsersController < ApplicationController
  before_action :set_user

  def mypage

  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.save
    redirect_back(fallback_location: root_path)
  end

  def edit

  end

  def update
    if current_user.update(user_params)
      binding.pry
      redirect_back(fallback_location: root_path)
    else
      render mypage_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
