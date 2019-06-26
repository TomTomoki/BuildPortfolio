class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if !@request.check_start_end_dates
      flash[:danger] = "終了日時は開始日時以降で設定してください。"
      render 'new'
    elsif @request.save
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
    binding.pry
  end

  private
    def request_params
      params.require(:request).permit(:title, :startDateTime, :endDateTime, :request_detail, :location, :requirements, :contact)
    end
end
