class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @group = current_user.group
  end

  def switch
    group = current_user.membered_groups.find(params[:group_id])
    current_user.update(:group => group)

    redirect_to user_path
  end
end
