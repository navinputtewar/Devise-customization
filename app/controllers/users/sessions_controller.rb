class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  ##--
  ## Purpose: Checking if the user is blocked by admin then restrict it form sign_in
  #++ 
  def create
    super
    if current_user.block?
       sign_out current_user
       flash[:notice] = "This account has been Blocked - Please Contact Admin"
       return 
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
