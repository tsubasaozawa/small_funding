class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def create
    category_list = params[:category_list].split(",")
    super
    @user.save_categories(category_list)
  end
  
end