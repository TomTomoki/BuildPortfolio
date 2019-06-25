class Request_Application < ApplicationRecord
    belongs_to :applicant, foreign_key: "applicant_id", class_name: "User"
    belongs_to :applied_request, foreign_key: "request_id", class_name: "Request"
end
