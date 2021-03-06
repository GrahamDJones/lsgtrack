require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }

  before do
    @ticket = FactoryGirl.create(:ticket)
    @ticket.watchers << user
  end

  it "notifies people thru a delayed job" do
    Delayed::Job.count.should eql(0)
    comment = @ticket.comments.create!(text: "This is a comment", user: @ticket.user)
    Delayed::Job.count.should eql(1)

    Delayed::Worker.new.work_off
    Delayed::Job.count.should eql(0)
    email = ActionMailer::Base.deliveries.last
    email.to.first.should eql(user.email)
    email.from.should eql(["lsg.tracker+#{comment.project.id}+#{comment.ticket.id}@gmail.com"])
  end

end
