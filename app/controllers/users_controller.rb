class UsersController < ApplicationController
   skip_before_action :verify_authenticity_token  
  def new
   @user = User.new 
   render :new
  end 

  # def login_user!
  #   user[:session_token] == session[:session_token]
  # end

  def create
    @user = User.new(user_params)
    
    if @user.save
      # login_user!(@user)
    
     render :show
    else  

      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params 
    params.require(:user).permit(:email, :password)
  end
end
