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

  def after_sign_in_path_for(current_user)
    if (current_user.has_role? :host) && (current_user.org_user_profile.present?) # checking if the host already has his Host Profile created or not
      @org_user_profile = OrgUserProfile.find(current_user.org_user_profile.id)
      host_profile_path
    elsif (current_user.has_role? :candidate) && (current_user.profile.present?)
      @profile = Profile.find(current_user.profile.id)
      candidate_profile_path
    elsif (current_user.has_role? :sponsor) && (current_user.sponsor.present?)
      @sponsor = Sponsor.find(current_user.sponsor.id)
      sponsor_path(@sponsor)
    elsif (current_user.has_role? :admin) && (current_user.admin.present?)
      @admin = Admin.find(current_user.admin.id)
      admin_page_path
    else
      my_roles_path
    end
  end

end
