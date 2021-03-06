class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      # redirect_back_or_to(:projects, notice: 'Login successful')
      redirect_to projects_path, notice: "Login successful"
    else

      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to projects_path
  end


end
