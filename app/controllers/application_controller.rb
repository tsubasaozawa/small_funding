class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_category
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :category_ids])
  end

  def set_category
    @tags = Category.limit(5)
  end
end
