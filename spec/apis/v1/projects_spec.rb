require "spec_helper"

describe "/api/v1/projects", type: :api do
  let(:user) { create_user! }
  let(:token) { user.authentication_token }

  before do
    @project = FactoryGirl.create(:project)
    @project2 = FactoryGirl.create(:project, name: "Access Denied")
    user.permissions.create!(action: "view", thing: @project)
  end

  context "projects viewable by this user" do
    let(:url) { "/api/v1/projects" }
    it "json" do
      get "#{url}.json", :token => token
      projects_json = Project.for(user).order(:name).to_json
      response.body.should eql(projects_json)
      response.status.should eql(200)
      projects = JSON.parse(response.body)
      projects.any? do |p|
        p["project"]["name"] == @project.name
      end.should be_true
      projects.any? do |p|
        p["project"]["name"] == @project2.name
      end.should be_false
    end
  end

end