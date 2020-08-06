module ApplicationHelper

  def loggedin?
    puts "-"*30
    puts session[:user_id]
    if session[:user_id] == nil
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
