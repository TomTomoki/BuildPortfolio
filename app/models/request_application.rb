class Request_Application < ApplicationRecord
    belongs_to :applicant, class_name: "User"
    belongs_to :request, class_name: "Request"
end
