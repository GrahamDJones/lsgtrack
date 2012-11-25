require 'spec_helper'

describe CommentsController do
  let(:user) { create_user! }
  let(:project) { Project.create!(name: "LSG Tracker") }
  let(:ticket) do
    project.tickets.create(title: "State transitions",
                           description: "Can't be hacked",
                           user: user)
  end
  let(:state) { State.create!(name: "New") }

  context "a user without permission to change state" do
    before do
      sign_in(:user, user)
    end

    it "cannot transition a state by passing thru state_id" do
      post :create, {tags: "",
                     comment: {text: "Hacked!", state_id: state.id},
                     ticket_id: ticket.id}
      ticket.reload
      ticket.state.should eql(nil)
    end

  end
end
