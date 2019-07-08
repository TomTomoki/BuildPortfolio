class RequestApplicationsController < ApplicationController
    def create
        user = current_user
        @request = Request.find(params[:request])
    
        if user.resume_registered?
            user.request_applications.create(request_id: @request.id)
            flash.now[:success] = "応募が完了しました。"
            render 'requests/show'
        else
            flash.now[:danger] = '応募には履歴書の登録が必要です。'
            #render 'resumes/new' 履歴書登録ページへ
        end
    end

    def destroy
        @request = current_user.applied_requests.find(params[:request])
        if Request_Application.find_by(applicant_id: current_user.id, request_id: @request.id).destroy
            flash.now[:success] = "応募を辞退しました。"
            render 'requests/show'
        else
            flash.now[:danger] = "応募を辞退できませんでした。"
            render 'requests/show'
        end
    end

    def change_application_status
        @request = current_user.created_requests.find(params[:request])
        applicant = @request.applicants.find(params[:applicant])

        Request_Application.find_by(applicant_id: applicant.id, request_id: @request.id).update(status: params[:new_status])
        flash.now[:success] = "hello"
        render 'requests/show'
    end
end
