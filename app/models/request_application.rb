class Request_Application < ApplicationRecord
    belongs_to :applicant, class_name: "User", foreign_key: "applicant_id"
    belongs_to :applied_request, class_name: "Request", foreign_key: "request_id"

    validates(:applicant_id, uniqueness: {scope: :request_id})
    
    
end
