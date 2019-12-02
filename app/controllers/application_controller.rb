class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_category
  before_action :set_today
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :profile_image])
  end

  def set_category
    @tags = Category.all
  end

  def set_today
    @today = Date.today
  end
end
