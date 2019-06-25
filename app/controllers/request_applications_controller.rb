class RequestApplicationsController < ApplicationController
    def create
        @user = current_user
        @requests = @user.created_requests
        
        if @user.resume_registered?
        #if @user.resume_registered? && !@user.applied?()
            #create request_application data


            return_back
        else
            flash.now[:danger] = '応募には履歴書の登録が必要です。'
            render 'users/show'
        end
    end

    def destroy

    end
end
