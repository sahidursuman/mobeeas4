# class RegistrationsController < ApplicationController ## original line when newly created, do not use, for reference only
# This RegistrationsController is to use for redirecting user to a specific page on successful sign up (registration)
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(current_user)
    my_roles_path
  end

  # This will redirect user to his current profile after the user updated the login email or password
  def after_update_path_for(current_user)
    if (current_user.has_role? :host) && (current_user.org_user_profile.present?)
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
    end
  end

end
