class NotificationMailer < ActionMailer::Base
  def notify_author(article)
    @article = article
    mail(:to => article.user.email,
         :from => "Administrador <admin@innku-wiki.com>",
         :subject => "Han comentado en el post del wiki")
  end
end
