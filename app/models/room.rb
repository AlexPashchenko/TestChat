class Room < ApplicationRecord
  has_many :messages
  belongs_to :user
  validates :title, :user_id, :presence => true
end
