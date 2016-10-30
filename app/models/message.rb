class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :text, :user_id, :room_id, :presence => true
end
