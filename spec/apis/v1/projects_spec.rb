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
      get "#{url}.json", token: token
      projects_json = Project.for(user).to_json
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

    it "XML" do
      get "#{url}.xml", token: token
      response.body.should eql(Project.for(user).to_xml)
      projects = Nokogiri::XML(response.body)
      projects.css("project name").text.should eql(@project.name)
    end
  end

  context "creating a project" do
    let(:url) { "/api/v1/projects" }
    before do
      user.admin = true
      user.save
    end

    it "successful json" do
      post "#{url}.json", token: token, project: {name: "Inspector"}
      project = Project.find_by_name("Inspector")
      route = "/api/v1/projects/#{project.id}"

      response.status.should eql(201)
      response.headers["Location"].should eql(route)
      response.body.should eql(project.to_json)
    end

    it "unsuccessful json" do
      post "#{url}.json", token: token, project: {}

      response.status.should eql(422)
      response.body.should eql({"errors" => {"name" => ["can't be blank"]}}.to_json)
    end
  end
end