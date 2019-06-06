class SessionsController < ApplicationController
   skip_before_action :verify_authenticity_token  
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
     )
    
    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else  
      redirect_to users_show_url[user] 
    end
      

    @user.reset_session_token! unless nil

    
  end


  def new
    render :new
  end

  def destroy
  end 

end
