class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Comment.create! body: data['comment']
  end
end
