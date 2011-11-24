class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record? 
  end

  def update
    if(params[resource_name][:current_password].blank? and params[resource_name][:password].blank? and params[resource_name][:password_confirmation].blank?)
      params[resource_name].delete(:current_password)
      params[resource_name].delete(:password)
      params[resource_name].delete(:password_confirmation)
      result = resource.update_attributes(params[resource_name]) 
    else
      result = resource.update_with_password(params[resource_name]) 
    end
    
    if result
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  def update_address
    if current_user.update_attribute(:address, params['update_address'])
      render :nothing => true, :status => 200
    end
  end
  
  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end


