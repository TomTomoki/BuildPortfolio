class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request[:creator_id] = current_user.id
    if @request.save
      flash[:success] = "新規リクエストが作成されました。"
      render 'show'
    else
      render 'new'
    end
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    if creator?(@request)
      @request.destroy
      flash[:success] = "募集を削除しました"
      redirect_to current_user
    else
      flash.now[:danger] = "他ユーザーの募集は削除できません。"
      render 'requests/show'
    end
  end

  private
    def request_params
      params.require(:request).permit(:title, :startDateTime, :endDateTime, :request_detail, :location, :requirements, :contact, :recruitment_number)
    end
end
