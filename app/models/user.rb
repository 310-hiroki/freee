class User < ApplicationRecord
  has_many :chat_messages

  validates :userid, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :name, presence: true, length: { maximum: 255 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
