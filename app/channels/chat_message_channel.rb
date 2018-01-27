class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_message_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ChatMessage.create! user_name: current_user.name, send_user_name: send_user.name, body: data['message']
  end
end
