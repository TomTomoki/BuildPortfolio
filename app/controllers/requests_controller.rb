class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
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
      params.require(:request).permit(:title, :date, :time)
    end
end
