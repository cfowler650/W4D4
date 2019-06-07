class SessionsController < ApplicationController
   skip_before_action :verify_authenticity_token 

  def create
  
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
     )
  
    if user
     log_in!(user)
     redirect_to users_show_url[user] 
    else  
     flash.now[:errors] = ["Incorrect username and/or password"]
     render :new
    end  

  end


  def new
    render :new
  end

  def destroy
  end 

end
