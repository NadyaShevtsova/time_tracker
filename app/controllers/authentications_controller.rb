class AuthenticationsController < ApplicationController
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create(:provider => omniauth ['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Association with #{omniauth['provider']} successful."
      redirect_to edit_user_registration_path
    else
      user = User.new
      user.apply_omniauth(omniauth)

      if user.save
        flash[:notice] = "Signed in successfully."
        Notifier.welcome(user, Digest::SHA1.hexdigest("--@#{self.username}-123548")[0,6]).deliver
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed association."
    redirect_to edit_user_registration_path
  end


end
