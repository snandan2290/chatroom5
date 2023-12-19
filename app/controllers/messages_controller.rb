class MessagesController < ApplicationController

    before_action :required_user

    def create
      Rails.logger.debug("Message::Crreate:params::#{params}")
      Rails.logger.debug("Mesage::current_user::#{current_user}/#{current_user.username}")
      message = current_user.messages.build(message_params)
      Rails.logger.debug("Message::message::#{message.inspect}")
      if message.save
        ActionCable.server.broadcast "chatroom_channel", 
                                      mod_message: message_render(message)
        # redirect_to root_path
      end
    end

    private 
    def message_params
      Rails.logger.debug("::::#{params.fetch(:message,{}).permit(:message_body)}")
      params.fetch(:message,{}).permit(:message_body)
    end

    def message_render(message)
      render(partial: 'message', locals: {message: message})
    end

end
