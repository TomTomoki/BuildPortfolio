class Request < ApplicationRecord
    validates(:title, presence: true, length: {:maximum => 50})
    validates(:startDateTime, presence: true)
    validates(:endDateTime, presence: true)
    validates(:location, presence: true)
    validates(:contact, presence: true)
end
