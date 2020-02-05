class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
    @events = Event.where(cheering_team: @user.support_team)
    @users = User.where(support_team: @user.support_team).order(created_at: :desc).limit(5)
  end
end
