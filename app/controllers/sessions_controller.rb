class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to profile_path(user) 
    else
      #Display error to user (do that in other places too)
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
