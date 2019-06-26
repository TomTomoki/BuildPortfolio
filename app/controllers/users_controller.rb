class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:info] = "新規ユーザが作成されました。"
      render 'show'
    else
      render 'new'
        #With the same URL, render the different template without a new request
    end
  end

  def show
    @user = User.find(params[:id])
    @createdRequests = @user.created_requests
    @appliedRequests = @user.applied_requests
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :birthdate, :email, :password,
                                   :password_confirmation)
    end
end
