# class RegistrationsController < ApplicationController ## original line
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(current_user)
    my_roles_path
  end

end
