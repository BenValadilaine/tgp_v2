class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      if remember?()
        remember(user)
      end
      redirect_to root_path :notice => "login_success"
    else
      redirect_to new_session_path :notice => "login_failure"
    end
  end

  def destroy
    @current_user = current_user()
    log_out(@current_user)
    redirect_to root_path
  end

  def remember?
    params[:remember_me]
  end

end
