class Notifier < ActionMailer::Base
  REPLY_TO = "lsg.tracker@gmail.com"
  default from: REPLY_TO

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    return_mail = "lsg.tracker+#{comment.project.id}+#{comment.ticket.id}@gmail.com"
    mail(to: user.email, reply_to: return_mail+ " <#{REPLY_TO}>",
         from: return_mail,
         subject: "[LSG Tracker] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
