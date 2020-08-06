class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  def create
    puts params
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])
    p user
    puts "**********************************"
    p params[:password]
    puts "****************************"
    p user.password_digest
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ succes'
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path
    else
      puts '-------------------------------- echec'
      #flash.now[:danger] = 'Invalid email/password combination'
      flash.alert = "User not found."
      redirect_to new_session_path
    end
  end

end
