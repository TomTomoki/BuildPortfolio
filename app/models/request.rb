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
    validates(:open, inclusion: {in: [true, false]})


    def check_start_end_dates
        return false if self.startDateTime.nil? || self.endDateTime.nil?
        if self.startDateTime >= self.endDateTime
            errors.add(:endDateTime, ": 終了は開始日時より後の日時のみ設定可能です。")
        end
    end

    def request_status_inJap
        if self.open
            return "募集中"
        elsif !self.open
            return "募集終了"
        else
            return "失敗"
        end
    end

    def get_applieds
        Request_Application.select{ |a| a.status == "applied" && a.request_id == self.id }.map{ |r| r.applicant }
    end

    def get_workings
        Request_Application.select{ |a| a.status == "working" && a.request_id == self.id }.map{ |r| r.applicant }
    end

    def get_completeds
        Request_Application.select{ |a| a.status == "completed" && a.request_id == self.id }.map{ |r| r.applicant }
    end

    def get_rejecteds
        Request_Application.select{ |a| a.status == "rejected" && a.request_id == self.id }.map{ |r| r.applicant }
    end
end