class Message < ApplicationRecord

  validates :message_body, presence: true, length: {minimum:1}
  belongs_to :user
  scope :custom_display, -> { order(:created_at).last(20)}
  # Ex:- scope :active, -> {where(:active => true)}
end
