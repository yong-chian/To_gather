
class ChatroomsController < ApplicationController
  def show
      booking = Booking.find(params[:id])
      @chatroom = Chatroom.find_or_create_by(booking: booking, name: booking.activity_id.name)
      @message = Message.new
      authorize (@chatroom)
  end
end

