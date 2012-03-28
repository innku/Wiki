class NotificationsController < ApplicationController
  respond_to :json

  def deliver
    article = Article.find(params[:article_id])
    if article.author_suscribed
      NotificationMailer.notify_author(article).deliver
    end

    render :nothing => true
  end
end
