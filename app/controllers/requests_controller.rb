class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = "新規リクエストが作成されました。"
      render 'show'
      #redirect_to root_url
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

  private
    def request_params
      params.require(:request).permit(:title, :startDateTime, :endDateTime, :request_detail, :location, :requirements, :contact)
    end
end
