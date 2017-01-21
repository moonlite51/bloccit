class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :method_name, only: [:index, :show]
  #before_action :other_method, except: [:new, :edit]

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to  edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
