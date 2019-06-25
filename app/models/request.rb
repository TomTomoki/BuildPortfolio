class Request < ApplicationRecord
    belongs_to :creator, foreign_key: "user_id", primary_key: "creator_id", class_name: "User"

    has_many :request_applications
    has_many :applicants, through: :request_applications, dependent: :destroy

    validates(:title, presence: true, length: {:maximum => 50})
    validates(:startDateTime, presence: true)
    validates(:endDateTime, presence: true)
    validates(:location, presence: true)
    validates(:contact, presence: true)
    validates(:creator_id, presence: true)
end