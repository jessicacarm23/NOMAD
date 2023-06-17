class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user_initiator, class_name: "User"
  belongs_to :user_receiver, class_name: "User"
end
