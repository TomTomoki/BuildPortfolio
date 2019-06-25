class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_request_from

    # どこのページからリクエストが来たか保存しておく
    def set_request_from
        if session[:request_from]
            @request_from = session[:request_from]
        end
        # 現在のURLを保存しておく
        session[:request_from] = request.original_url
    end

    # 前の画面に戻る
    def return_back
        if request.referer
            redirect_back fallback_location: request.referer and return true
        elsif @request_from
            redirect_to @request_from and return true
        end
    end
end
