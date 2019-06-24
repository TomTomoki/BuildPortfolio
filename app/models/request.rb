class Request < ApplicationRecord
    belongs_to :user
    has_many :applications, dependent: :destroy

    validates(:title, presence: true, length: {:maximum => 50})
    validates(:startDateTime, presence: true)
    validates(:endDateTime, presence: true)
    validates(:location, presence: true)
    validates(:contact, presence: true)
    validates(:user_id, presence: true)
end