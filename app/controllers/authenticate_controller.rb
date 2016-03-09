class AuthenticateController < ApplicationController
  def login
    if request.post?
      teacher = Teacher.find_by(email: params[:email])

      if teacher && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        redirect_to teachers_path, notice: "Logged in!"
      else
        flash[:notice] = "Please try again"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    redirect_to authenticate_login_path, notice: "You have been logged out"
  end
end
