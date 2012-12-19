require "spec_helper"

describe "/api/v1/time_entries", type: :api do
  let(:project) { FactoryGirl.create(:project, name: "Inspector") }
  before do
    @user = create_user!
    @user.admin = true
    @user.save
    @user.permissions.create!(action: "view", thing: project)
    @user.permissions.create!(action: "report_time", thing: project)
  end
  let(:token) { @user.authentication_token }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, user: @user) }


  context "creating a time entry" do
    let(:url) { "/api/v1/time_entries" }

    it "successful json" do
      post "#{url}.json", token: token, time_entry: {work_date: "2012-12-20", duration_minutes: 25, ticket_id: ticket.id }
      project = Project.find_by_name("Inspector")
      time_entry = project.time_entries.first
      route = "/api/v1/time_entries/#{time_entry.id}"

      response.status.should eql(201)
      response.headers["Location"].should eql(route)
      response.body.should eql(time_entry.to_json)
    end

    it "unsuccessful json" do
      post "#{url}.json", token: token, time_entry: {}

      response.status.should eql(422)
      response.body.should eql({"errors" => {"work_date" => ["Date can't be blank"],
                                             "ticket_id" => ["Ticket can't be blank"],
                                             "duration" => ["Duration can't be blank"],
                                             "user" => ["User can't be blank"]}}.to_json)
    end
  end


  end