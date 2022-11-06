class Users::SessionsController < ApplicationController
end

class Users::SessionsController < ApplicationController
  def new
  end

  def create
    if sign_in(:user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out(:user)
    redirect_to root_path
  end
end
