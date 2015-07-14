class DashboardController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from Net::SMTPFatalError, :with => :smtp_fatal_error

  before_filter :authenticate_user!, :except => [:index, :about]
  #before_filter :check_for_blocking
  
  
  def index
    
  end

  ##--
  ## Purpose: List all the users from the User Model.
  ## Restrict the user if it is not admin.
  ## allowing the user if he/she is admin.
  #++ 
  def listing
    @user = User.all
    unless current_user.admin?
      redirect_to dashboard_show_path
    end  
  end

  def new
    @user = User.new
  end

  ##--
  ## Purpose: allowing admin to create user
  #++ 
  def create
    @user = User.new(user_params)
    if @user.valid?
       @user.save
       render 'admin_show'
    else
       redirect_to dashboard_new_path
    end
  end

  ##--
  ## Purpose: allowing admin to see profile of each user.
  #++ 
  def admin_show
    @user = User.find(params[:format])
  end

  ##--
  ## Purpose: if user is not a admin then he/she can only see his own profile.
  #++ 
  def show
    @user = current_user.id 
  end

  ##--
  ## Purpose: allowing admin to delete perticular user.
  #++ 
  def delete
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

  ##--
  ## Purpose: to block a perticular user.
  #++ 
  def blocked
    @user = User.find(params[:id])
    @user.block!
    redirect_to dashboard_listing_path
  end

  
  private
  
  ##--
  ## Purpose: parameters to create user.
  #++ 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :dob, :profile_picture, :email, :password, :password_confirmation, :admin)
  end

  ##--
  ## Purpose: Checking if the user is blocked by admin then restrict it form sign_in
  #++ 
  # def check_for_blocking
  #   if current_user.block?
  #      sign_out current_user
  #      flash[:error] = "This account has been Blocked - Please Contact Admin"
  #      redirect_to root_path 
  #   end
  # end
  
  ##--
  # purpose: To show ERROR MSG when invalid email entered and rescued from SMTP_FATAL_ERROR
  #++
  def smtp_fatal_error
    flash[:error] = "You have entered invalid email address which doesn't exists."
    redirect_to dashboard_new_path
  end
  
  ##--
  # purpose: To show ERROR MSG when request for Unknown record is pass
  #++
  def record_not_found
    flash[:error] = "You don't have this record."
    redirect_to '/'
  end
end
