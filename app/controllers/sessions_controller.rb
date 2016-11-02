class SessionsController < ApplicationController
  before_action :private_access, only: [:destroy]
  before_action :public_access, except: [:destroy]
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:notice] = "Bienvenido"
      redirect_to root_path
    else
      flash[:notice] = "Tu email y/o contraseña son inválidas. Intenta nuevamente."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end


end
