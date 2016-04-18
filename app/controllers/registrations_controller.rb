# class RegistrationsController < ApplicationController ## original line when newly created, do not use, for reference only
# This RegistrationsController is to use for redirecting user to a specific page on successful sign up (registration)
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(current_user)
    my_roles_path
  end

end
