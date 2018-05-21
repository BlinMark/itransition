class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    Comment.create! body: data['comment']
    ActionCable.server.broadcast 'post_channel', comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    ApplicationController.renderer.render(partial: 'comments/template',
                                          locals: {comment: comment })
  end
end
