class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
