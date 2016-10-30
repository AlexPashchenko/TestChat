class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rooms
  has_many :messages
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50#" }, :default_url => '/system/avatar_missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
