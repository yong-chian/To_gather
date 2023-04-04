class PrivateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "private_#{params[:id]}" if authorized_channel?
  end

  private

  def authorized_channel?
    # Check if the current user is authorized to subscribe to the channel.
    # For example, you could check if they have the correct permissions or if they are a member of the corresponding group.
    current_user.can_access_private_channel?(params[:id])
  end

  # def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  # end
end



# In this example, we're defining a PrivateChannel that streams data from a private channel based on the id parameter. We only want to allow authorized users to subscribe to this channel, so we're calling authorized_channel? before streaming the data.

# The authorized_channel? method is defined as a private method that checks if the current user can access the private channel based on some custom logic. You can define this method to suit your application's specific needs.

# With this setup, only authorized users will be able to subscribe to the PrivateChannel and receive the corresponding data stream.





