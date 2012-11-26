class Receiver < ActionMailer::Base
  default from: Notifier::REPLY_TO

  def self.parse(email)
    reply_separator = /(.*?)\s?== ADD YOUR REPLY ABOVE THIS LINE ==/m
    comment_text = reply_separator.match(email.body.to_s)
    if comment_text
      to, project_id, ticket_id =
          email.to.first.split("@")[0].split("+")
      #TODO If the replyto has been mangled, the original may be in the message body:
      #Here is my comment
      #On Mon, Nov 26, 2012 at 12:02 PM, lsg.tracker+1+1@gmail.com <lsg.tracker@gmail.com> wrote:
      #
      #    == ADD YOUR REPLY ABOVE THIS LINE ==
      # Some ticket commentary
      #So parse it out
      if project_id
        project = Project.find(project_id)
        ticket = project.tickets.find(ticket_id) if project
        if ticket
          user = User.find_by_email(email.from[0])
          if user
            ticket.comments.create(text: comment_text[1].strip, user: user)
            ticket.save
          end
        end
      end
    end
  end
end
