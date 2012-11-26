class Notifier < ActionMailer::Base
  default from: "lsg.tracker@gmail.com"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(to: user.email,
         subject: "[LSG Tracker] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
