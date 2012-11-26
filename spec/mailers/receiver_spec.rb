require 'spec_helper'

describe Receiver do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket_owner) { FactoryGirl.create(:user) }
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project,
                                     :user => ticket_owner) }
  let!(:commenter) { FactoryGirl.create(:user) }
  let(:comment) do
    #Comment.new({
    #                :ticket => ticket,
    #                :user => commenter,
    #                :text => "Test comment"
    #            }, :without_protection => true)
    FactoryGirl.create(:comment,
                       :ticket => ticket,
                       :user => commenter,
                       :text => "Test comment"
    )
  end

  it "parses a reply from a comment update into a comment" do
    #print "TICKET: #{ticket.pretty_inspect}"
    #print "COMMENT: #{comment.pretty_inspect}"
    sent_mail = ActionMailer::Base.deliveries.last
    #print "SENT_MAIL: #{sent_mail.pretty_inspect}"
    original = Notifier.comment_updated(comment, ticket_owner)
    reply_text = "This is a brand new comment"
    #print "SENT_MAIL.FROM: #{sent_mail.from}"
    #print "SENT_MAIL.FROM.FIRST: #{sent_mail.from.first}"
    reply = Mail.new(:from => commenter.email,
                     :subject => "Re: #{original.subject}",
                     :body => %Q{#{reply_text}
                     #{original.body}
                     },
                     :to => sent_mail.reply_to)
    #TODO This does not work -- ActionMailer parses out the reply_to and strips the encoded project/ticket
    #lambda { Receiver.parse(reply) }.should(
    #    change(comment.ticket.comments, :count).by(1)
    #)
    #ticket.comments.last.text.should eql(reply_text)
    #print "ORIGINAL: #{original.pretty_inspect}"
    #print "REPLY: #{reply.pretty_inspect}"
    #print "TICKET.COMMENTS: #{ticket.comments.pretty_inspect}"
  end
end
