class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def create
    @user = User.where(email: params[:email]).first ||
            User.invite!({:email => params[:email], :name => params[:name]}, current_user)

    @membership = @group.memberships.new(:user => @user)

    if @membership.save
      redirect_to @group, notice: 'User was successfully added (or invited).'
    else
      render :index
    end
  end

  def destroy
    @membership = @group.memberships.find(params[:id])
    @membership.destroy
    redirect_to @group, notice: "User's membership was successfully removed."
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
