class Users::SessionsController < Devise::SessionsController
 def create
       ##验证邮箱是否存在
  resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
  set_flash_message(:notice, :signed_in) if is_navigational_format?
  sign_in(resource_name, resource)



   respond_to do |format|
       resource.ensure_authentication_token

        format.html { redirect_to documents_url, notice: 'Blog was successfully created.' }
       format.json { 
         render json: {token:resource.authentication_token, user_id: resource.id}
       }
     end
 end
                                                                                                                   

 def destroy
   current_user.authentication_token = Devise.friendly_token
   sign_out(current_user)
   render json: {success: true}
 end

end
