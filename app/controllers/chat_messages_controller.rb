class ChatMessagesController < ApplicationController
  before_action :require_login!

  def index
    user = session[:user_id]
    user = User.find(user)
    send_user_id = params[:id]
    @send_user = User.find(send_user_id)
    cookies.permanent.signed[:send_user_id] = @send_user.id
    @messages = ChatMessage.where(" user_name = ? and send_user_name = ?", user.name, @send_user.name).or(ChatMessage.where(" user_name = ? and send_user_name = ?", @send_user.name, user.name)) 
  end
end
