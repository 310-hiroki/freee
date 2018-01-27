module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :send_user

    def connect
      self.current_user = find_verified_user
      self.send_user = find_verified_send_user
      logger.add_tags 'ActionCable', current_user.id
      logger.add_tags 'ActionCable', send_user.id
    end

    protected

      def find_verified_user
        if verified_user = User.find_by(id: cookies.signed[:user_id])
          verified_user
        else
          reject_unauthorized_connection
        end
      end

      def find_verified_send_user
        if verified_send_user = User.find_by(id: cookies.signed[:send_user_id])
          verified_send_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
