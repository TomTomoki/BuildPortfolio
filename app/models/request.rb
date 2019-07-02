class Request < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

    has_many :request_applications, class_name: "Request_Application", foreign_key: "request_id"
    has_many :applicants, class_name: "User", through: :request_applications, dependent: :destroy

    validates(:title, presence: true, length: {:maximum => 50})
    validates(:startDateTime, presence: true)
    validates(:endDateTime, presence: true)
    validate(:check_start_end_dates)
    validates(:location, presence: true)
    validates(:recruitment_number, presence: true)
    validates(:contact, presence: true)
    validates(:creator_id, presence: true)


    def check_start_end_dates
        return false if self.startDateTime.nil? || self.endDateTime.nil?
        if self.startDateTime >= self.endDateTime
            errors.add(:endDateTime, ": 終了は開始日時より後の日時のみ設定可能です。")
        end
    end
end