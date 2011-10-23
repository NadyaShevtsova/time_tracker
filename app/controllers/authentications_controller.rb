class AuthenticationsController < ApplicationController
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, tasks_path)
    elsif current_user
      current_user.authentications.create(:provider => omniauth ['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Association with #{omniauth['provider']} successful."
      redirect_to edit_user_registration_path

    else
      user = User.new
      user.authentications.build(:provider => omniauth ['provider'], :uid => omniauth['uid'])
      user.save!
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, tasks_path)
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed association."
    redirect_to edit_user_registration_path
  end


end
