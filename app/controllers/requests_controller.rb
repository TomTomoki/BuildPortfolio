class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = current_user.created_requests.create!(request_params)
    @user = @request.creator
    if !@request.nil?
      flash[:success] = "新規リクエストが作成されました。"
      render 'show'
    else
      flash[:danger] = "新規リクエストが作成失敗。"
      render 'new'
    end
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.creator
  end

  def destroy
    @request = current_user.created_requests.find(params[:id])
    if @request.destroy
      flash[:success] = "募集を削除しました。"
      redirect_to current_user
    else
      flash[:danger] = "募集削除に失敗しました。"
      redirect_to current_user
    end
  end

  def change_open_status
    @request = current_user.created_requests.find(params[:id])
    @user = @request.creator
    if @request.update(open: !@request.open)
      flash[:success] = "募集ステータスを変更しました。"
      render 'show'
    else
      flash[:danger] = "募集ステータスの変更に失敗しました。"
      render 'show'
    end
  end

  private
    def request_params
      params.require(:request).permit(:title, :startDateTime, :endDateTime, :request_detail, :location, :requirements, :contact, :recruitment_number)
    end
end
