
class ChatroomsController < ApplicationController
    def show
        booking = Booking.find(params[:id])
        @chatroom = Chatroom.find_or_create_by(booking: booking)
        if booking.user_name != (current_user.first_name + " " + current_user.last_name)
            @chatroom.name = booking.user_name
        else
            @chatroom.name = Activity.find(booking.activity_id).name
        end
        @message = Message.new
        authorize (@chatroom)
    end
end


