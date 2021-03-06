class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  protect_from_forgery

  after_action :user_activity
  def index
    # @users = User.all.order(created_at: :desc)
    if current_user.has_role?(:admin)
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    else
      redirect_to root_path, alert: 'you dont have access'
    end
  end
  
  def show
  end
  
  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: 'User roles were successfully updated.'
    else
      render :edit
    end
  end

  private
  
  def user_activity
    current_user.try :touch
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end