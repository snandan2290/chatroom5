class ChatroomController < ApplicationController

  before_action :required_user

  def home
    @message = Message.new
    get_messages
  end

  private 
  def get_messages
    return @messages if @messages
    if !@messages
      @messages = Message.all
    end
  end


end