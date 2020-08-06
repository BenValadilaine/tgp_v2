class SessionsController < ApplicationController

  def new

  end

  def create
    puts params
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_path :notice => "login_success"
    else
      redirect_to new_session_path :notice => "login_failure"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path

  end

end
