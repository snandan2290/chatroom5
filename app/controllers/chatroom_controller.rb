class ChatroomController < ApplicationController

  before_action :get_messages, only: [:home]

  def home
  
  end

  private 
  def get_messages
    return @messages if @messages
    if !@messages
      @messages = Message.all
    end
  end


end