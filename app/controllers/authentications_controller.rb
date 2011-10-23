class AuthenticationsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"] 
    current_user.authentications.create(:provider => auth ['provider'], :uid => auth['uid'])
    flash[:notice] = "Association with #{auth['provider']} successful."
   redirect_to edit_user_registration_path


=begin
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_form_hash(omniauth)
    if current_user
      current_user.authentications.create!(:provider => omniauth ['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Association with #{auth['provider']} successful."
      redirect_to edit_user_registration_path
    elsif authentication 
    else
      
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed association."
    redirect_to edit_user_registration_path
  end
=end

end
