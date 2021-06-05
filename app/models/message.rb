class Message < ApplicationRecord
	validates :message, presence: true
    validates :user_message_id, presence: true
end
    