class StaticPagesController < ApplicationController
  def home
    #@requests = []
    @requests = Request.order("created_at").last(4)
  end
end
