class Message < ApplicationRecord

  validates :message_body, presence: true, length: {minimum:1}
  belongs_to :user

end
