module ApplicationHelper

  def loggedin?
    if session[:user_id] == nil
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def loggedin_view?
    if session[:user_id] == nil
      flash[:danger] = "Please log in."
    end
  end
end
