class Request_Application < ApplicationRecord
    belongs_to :applicant, class_name: "User", foreign_key: "applicant_id"
    belongs_to :applied_request, class_name: "Request", foreign_key: "request_id"

    validates(:applicant_id, uniqueness: {scope: :request_id})
    #validate(:numOf_working_requests_cannot_be_more_than_recruitment_numbers)
    #validate(:creator_cannot_apply_to_his_own_request)

    
    def numOf_working_requests_cannot_be_more_than_recruitment_numbers
        counter = 0

        applications = Request_Application.where(request_id: self.request_id)

        applications.each { |application|
            if (application.status == "working")
                counter += 1
            end

            if (counter > application.recruitment_number)
                errors.add(:status, ": 募集人数を超えた採用はできません")
            end
        }
    end

    def creator_cannot_apply_to_his_own_request
        if (self.applicant_id == Request.find(self.request_id).creator_id)
            errors.add(:status, ": 募集投稿者は自身の募集に応募できません")
        end
    end

    def status_in_Jap
        if self.status == "applied"
            "応募済み"
        elsif self.status == "working"
            "取り組み中"
        elsif self.status == "completed"
            "終了済み"
        elsif self.status == "rejected"
            "不採用・解雇"
        else
            "エラー"
        end
    end
end
