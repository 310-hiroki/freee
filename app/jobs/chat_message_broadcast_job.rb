class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat_message_channel', user_name: message.user_name, send_user_name: message.send_user_name, message: message.body
  end
end
