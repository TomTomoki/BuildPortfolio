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

    def get_applied_applicants
        self.request_applications.select{ |a| a.status = "applied" }.map{ |r| r.applicant }
    end

    def get_workings
        self.request_applications.select{ |a| a.status = "working" }
    end

    def get_completeds
        self.request_applications.select{ |a| a.status = "completed" }
    end

    def get_rejecteds
        self.request_applications.select{ |a| a.status = "rejected" }
    end

    def get_withdrawns
        self.request_applications.select{ |a| a.status = "withdrawn" }
    end
end