require "spec_helper"

describe "/api/v1/tickets", type: :api do
  let(:project) { FactoryGirl.create(:project) }
  before do
    @user = create_user!
    @user.admin = true
    @user.save
    @user.permissions.create!(action: "view", thing: project)
  end
  let(:token) { @user.authentication_token }

  context "index" do
    before do
      5.times do
        FactoryGirl.create(:ticket, project: project, user: @user)
      end
    end
    let(:url) { "/api/v1/projects/#{project.id}/tickets"}

    it "XML" do
      get "#{url}.xml", token: token
      response.body.should eql(project.tickets.to_xml)
    end

    it "JSON" do
      get "#{url}.json", token: token
      response.body.should eql(project.tickets.to_json)
    end
  end


end