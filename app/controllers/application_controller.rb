class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_admin unless :devise_controller

  def check_admin
    unless current_user.has_role? :admin
      redirect_to root_path
    end
  end
end
